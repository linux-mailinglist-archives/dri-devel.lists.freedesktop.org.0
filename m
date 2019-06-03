Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA333FB2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED698967A;
	Tue,  4 Jun 2019 07:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AE89057
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:37 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id v4so983697qkj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=luHVeQDtsejNe05MbpEHIJ5FAOspLsm1rW4+f3IOXdc=;
 b=sS+InX6bKaEujyHrfv+jMF5p+HZzK0SJDa0TXNqlVrhY2SEVJKxBDnh4edr0+aZuHq
 YCX3ARnn8NbrmyKlvJGIgzsN/bRctdnLe7NvYnM/kerrVmn5/hBpjgShUTf+HCacIBT6
 Nm91YOk01JtLOcw92YdG7ojxrqAzMqvm4q+cBm7i/7DzOF4aq3vtTKUyoaLMmAxcTYpJ
 /m2892aOvgi9nUgRs88UVUUFbHqbUbjOARHegRVWTz9r1mf57dKLFRNjWfjP0G13G0qg
 +qj4FtjSZSCQR1bt2KlPc2cZqZnRXyR/Kq3+pJXqEiNT9HnHk8gMML0ewBp1d5IiZ4Lq
 6Ssw==
X-Gm-Message-State: APjAAAUEy441PWeJo/cT0lotPIjOIiGl5xyc7bdFtR2nDcEqZUYHjEtx
 Gstxk8KAOZjM4JHgpQhcpzo9n+JWYHUfjAq7
X-Google-Smtp-Source: APXvYqxWajnT2+NV3xTud3R56ZNhfS6I5UrUDe55n3y1jJe3OWUToUGKN+BmVqJ0YCPX/M4xXQWJhyPq+bf/72n5
X-Received: by 2002:a0c:ad23:: with SMTP id u32mr3896810qvc.39.1559580936412; 
 Mon, 03 Jun 2019 09:55:36 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:06 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 04/16] mm: untag user pointers in do_pages_move
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=luHVeQDtsejNe05MbpEHIJ5FAOspLsm1rW4+f3IOXdc=;
 b=ew82e7NzIq+8fpVjdyGeAl2NjSKK4p0nGZ5QsTZKvqtsLjuuAXvE063KXb+pD0cHy3
 33+cPut/htgPr27GTzwOcJ20GBX2Ux9NssttTzwHChq9HvO45Yd1WsNH+qMaKhyQDDTc
 D+9zMoo5SrYePAGdOkXZXmMQhF2t0ypsOVpok1EOYB7sNktF/Rh9uldB40uKjOJapI1g
 axLdF69gRV4YSFbj/UQdIsHxS2aGe/kJaiIGVBIH5qRmQS2qsSWYGny0rQfE2+NQmVfF
 bjXTeOgusRer2Jz6pFuYk/PEgndLJQ02z9T1gNTKOM3uuFHRlwHl2aCc1w3EkCHnhf6g
 ZiTA==
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
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpkb19wYWdlc19tb3ZlKCkgaXMgdXNlZCBpbiB0aGUgaW1wbGVtZW50YXRpb24g
b2YgdGhlIG1vdmVfcGFnZXMgc3lzY2FsbC4KClVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBm
dW5jdGlvbi4KClJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bh
cm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2ds
ZS5jb20+Ci0tLQogbW0vbWlncmF0ZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9tbS9taWdyYXRlLmMgYi9tbS9taWdyYXRlLmMKaW5kZXggZjJl
Y2MyODU1YTEyLi4zOTMwYmI2ZmE2NTYgMTAwNjQ0Ci0tLSBhL21tL21pZ3JhdGUuYworKysgYi9t
bS9taWdyYXRlLmMKQEAgLTE2MTcsNiArMTYxNyw3IEBAIHN0YXRpYyBpbnQgZG9fcGFnZXNfbW92
ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgbm9kZW1hc2tfdCB0YXNrX25vZGVzLAogCQlpZiAoZ2V0
X3VzZXIobm9kZSwgbm9kZXMgKyBpKSkKIAkJCWdvdG8gb3V0X2ZsdXNoOwogCQlhZGRyID0gKHVu
c2lnbmVkIGxvbmcpcDsKKwkJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7CiAKIAkJZXJyID0g
LUVOT0RFVjsKIAkJaWYgKG5vZGUgPCAwIHx8IG5vZGUgPj0gTUFYX05VTU5PREVTKQotLSAKMi4y
Mi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
