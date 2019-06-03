Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9512733FAD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE4889700;
	Tue,  4 Jun 2019 07:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E229892A5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:56:04 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id q13so4406597qtj.15
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=EspxEupGJGiWEDXD9P4jjgWKmcXH74NzvYIbJ/AWgMI=;
 b=GpY/KNbEiE2qVe0AcDZ7ycb7sV5gUX4m/dLN0wDBk5ayM9icRp3+czmPIHgM6O14Fq
 6ayJ73YAb6eMUADHNna2+eeMxA2RVLKwTAbIsJ9WsGPmPfjA36cCg0/YOXQkV9uPd3nf
 8C8HNi6MTAP9x62CO4KQRgdrbDZ4gdgtMqFz5xA1uu0ndh3KDLnUWBBQf1vu0wp2RGe/
 sLMIwRE1DqGDjHuTsvZl49xyQ7O28El9hcwqKiCEhVkp7xUiatfoDlJjaC+GehDfKVnw
 UIq7vatKvGFuDIQKwz8GPN9/Pf5MjTjaET9275yVcmqf4AhovyKfa0dCUPdb5mET+wON
 2I5w==
X-Gm-Message-State: APjAAAW2cnD5aaaWgIAxZajfuDNzXE9nj+TkOGvE8KdiQ9sQgODo9elA
 0wuVEr04ivXTKWlXdzma+c20kromsw4tBbsZ
X-Google-Smtp-Source: APXvYqyTJQX58jIU+0IdRLMyhel9C9SXAf29MqpC57OIYMzhYLqjfoH2DhcsbA5oBHVd1rJqiIiEUBwjKZJxchdB
X-Received: by 2002:a0c:be87:: with SMTP id n7mr3853859qvi.65.1559580963191;
 Mon, 03 Jun 2019 09:56:03 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:14 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 12/16] IB,
 arm64: untag user pointers in ib_uverbs_(re)reg_mr()
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
 bh=EspxEupGJGiWEDXD9P4jjgWKmcXH74NzvYIbJ/AWgMI=;
 b=TJVcn1cLKwrCDqfOoDXp30a4H6TaXBKiwiHjDAdwongHK/bKzo02AftS+NOLHZV2qk
 uaXFTsh7OP9kK6tBgKChXJ2KBusgSI13ByE5QAJT4opcCyHzVAEN7KnoiqvVvgIk9UeZ
 thbX5DYw+Ya/O9Bt8a5AL4KNqAUsZ4B4hEfnsQKdt+gJFBe02e/Gllpw40I3Eh8jjzXh
 yX2E6mPgl8q0tFyhEApdfs/i0GKdcLnrmq2mOZHSQm727N+W9pKIuuH8ohRLmjbmQDTf
 QCPeVpMCsS5AlW/faffrLj+KIOBAFryuyM2XhBVLl0qrMu2w3WMArdINiV+/WP+bh/um
 j3qg==
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
cmd1bWVudHMuCgppYl91dmVyYnNfKHJlKXJlZ19tcigpIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50
ZXJzIGZvciB2bWEgbG9va3VwcyAodGhyb3VnaAplLmcuIG1seDRfZ2V0X3VtZW1fbXIoKSksIHdo
aWNoIGNhbiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KClVudGFnIHVzZXIg
cG9pbnRlcnMgaW4gdGhlc2UgZnVuY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92
YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3Jl
L3V2ZXJic19jbWQuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyBiL2RyaXZl
cnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYwppbmRleCA1YTNhMTc4MGNlZWEuLmY4OGVl
NzMzZTYxNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5j
CisrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYwpAQCAtNzA5LDYgKzcw
OSw4IEBAIHN0YXRpYyBpbnQgaWJfdXZlcmJzX3JlZ19tcihzdHJ1Y3QgdXZlcmJzX2F0dHJfYnVu
ZGxlICphdHRycykKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJY21kLnN0YXJ0ID0gdW50
YWdnZWRfYWRkcihjbWQuc3RhcnQpOworCiAJaWYgKChjbWQuc3RhcnQgJiB+UEFHRV9NQVNLKSAh
PSAoY21kLmhjYV92YSAmIH5QQUdFX01BU0spKQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtNzkx
LDYgKzc5Myw4IEBAIHN0YXRpYyBpbnQgaWJfdXZlcmJzX3JlcmVnX21yKHN0cnVjdCB1dmVyYnNf
YXR0cl9idW5kbGUgKmF0dHJzKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwljbWQuc3Rh
cnQgPSB1bnRhZ2dlZF9hZGRyKGNtZC5zdGFydCk7CisKIAlpZiAoY21kLmZsYWdzICYgfklCX01S
X1JFUkVHX1NVUFBPUlRFRCB8fCAhY21kLmZsYWdzKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAK
Mi4yMi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
