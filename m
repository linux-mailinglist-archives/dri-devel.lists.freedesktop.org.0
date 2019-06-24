Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B052499
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22936E049;
	Tue, 25 Jun 2019 07:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37989B69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:48 +0000 (UTC)
Received: by mail-vs1-xe4a.google.com with SMTP id v20so3924479vsi.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cqAi+OvlHabK4r0DKR/uDYr47zBS8kkFmriW/t8FK6c=;
 b=Ck4UkjSEfNcXpoXQQvY8QgnHIq6HUd2VfEKYzsvKWVjAIEb8qS+Ob8coI6oXxSPXaE
 oYFAJmd/XVxMwbW4QeJrkd3lXPAFI92VAGQt4DAIy+gZwcHQdKNdPCKeNgbLxWDQI3EH
 GL+xXzlGaZoWY574bo5wiFFVnaMahbsrOQQnBTPam7v+7WDqspsMnXMpqY5Z1spp1qUa
 FEdHdj0BhExQ2uP58PujVYdvHIPCSOEFJKMCPTrs0zPTCTkBegS5W+Zdv2kMGRWVStNc
 rknwnOyIyHZ28EHOsGxi4GKZK+l5PodZxyJeOJmFPafAe2G1V9HLQZvCDZKdHbPFWZJx
 A4zg==
X-Gm-Message-State: APjAAAXiB5MEyS2eBtyz3UpA28CBeYQ+CR5fTSFCAsaNJ9kfPYcIYqoc
 AQK+sN32WUqW9xSo+G/dSZTW+dR3gIdFN8+6
X-Google-Smtp-Source: APXvYqzY+u8RznlTrOWrBgn25HhvDfTMe7SZyf9e34JUgJZBNd08PatZvu4lGf3zfqdvX7DoXuI91wYnbBpoYfQ0
X-Received: by 2002:ab0:7848:: with SMTP id y8mr60797129uaq.58.1561386827462; 
 Mon, 24 Jun 2019 07:33:47 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:58 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <280ca5496fe82873caac306ca76fb40d702979ff.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 13/15] tee/shm: untag user pointers in tee_shm_register
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=cqAi+OvlHabK4r0DKR/uDYr47zBS8kkFmriW/t8FK6c=;
 b=lXHRsLKGuntJdIfx4IktI470fGbyq/kS83cL/1CQ6KcaqQfI5cgbGIOLx+on2O/XRl
 TyhQq0vCGRVG2NDDFcvggYJ0wxa3AKn2CR+yK/03NNoH4bycNdBR8ox3sdPwTeSrQLuo
 rHeW6O5U9Mg0jIkwq44zjpbQCUdfc3U4ayQ8Dr3awwdf8ADrTM4zsPAD1J2Hva/3oEGx
 iuAfMdkeDB0VVqrLEmMomvjY9gvAQgEF5ueMNKjNbD3E+c53zhezKvbXOoKR1nLLue5p
 C6JfI9UG0Qq2Dtp4qvSg2UI+NSz05kgH40lBS5dNGwoMFiWCdzLiE4V8NQ/k/pPRpCug
 2y1w==
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkg
dG8gYWxsb3cgdG8gcGFzcwp0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUg
c2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCgp0ZWVfc2htX3JlZ2lzdGVyKCktPm9wdGVlX3NobV91bnJlZ2lzdGVyKCktPmNoZWNrX21l
bV90eXBlKCkgdXNlcyBwcm92aWRlZAp1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3VwcyAodmlh
IF9fY2hlY2tfbWVtX3R5cGUoKSksIHdoaWNoIGNhbiBvbmx5IGJ5CmRvbmUgd2l0aCB1bnRhZ2dl
ZCBwb2ludGVycy4KClVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBmdW5jdGlvbi4KClJldmll
d2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6IEplbnMg
V2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy90ZWUvdGVl
X3NobS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3RlZS90ZWVfc2htLmMgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKaW5kZXggMmRh
MDI2ZmQxMmM5Li4wOWRkY2QwNmM3MTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGVlL3RlZV9zaG0u
YworKysgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKQEAgLTI1NCw2ICsyNTQsNyBAQCBzdHJ1Y3Qg
dGVlX3NobSAqdGVlX3NobV9yZWdpc3RlcihzdHJ1Y3QgdGVlX2NvbnRleHQgKmN0eCwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAogCXNobS0+dGVlZGV2ID0gdGVlZGV2OwogCXNobS0+Y3R4ID0gY3R4Owog
CXNobS0+aWQgPSAtMTsKKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKIAlzdGFydCA9IHJv
dW5kZG93bihhZGRyLCBQQUdFX1NJWkUpOwogCXNobS0+b2Zmc2V0ID0gYWRkciAtIHN0YXJ0Owog
CXNobS0+c2l6ZSA9IGxlbmd0aDsKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
