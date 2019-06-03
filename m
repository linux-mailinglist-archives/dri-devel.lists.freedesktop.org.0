Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25F633FC7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD91F89722;
	Tue,  4 Jun 2019 07:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x34a.google.com (mail-ot1-x34a.google.com
 [IPv6:2607:f8b0:4864:20::34a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8625189057
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:56:00 +0000 (UTC)
Received: by mail-ot1-x34a.google.com with SMTP id n19so1475969ota.14
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=J9pRn7M3NANi3nsm6t0U9rkGUXnmKvJ1SqswIr7oBNs=;
 b=mU1neN0Sr3qRH+rh8kBzAKVn/rxYLCAUGZOvA+EC7P0tfkjUu0nD87qbWrnS+Lg12A
 OlCjt81/urIv0SrWgI4PoHB87MbkxaTa/icmYCAdf8NonN3sFNm2AoIqy37s/UrbbZuq
 ZokFLIU1WZ0p5sI7y8pXN42ZaJitywqIle4MG0GiGQweLmXfRBcjMbsqrhz3/KzpYBYl
 iFvtgxyfTr/usnMCOOkbkTapA3QOF6IZJcDboTVDUmMn1QlBCz0ZvIC3XWn89QP1s9Gz
 vFm9KF5H7mmwCckbcl8i6me3C+yeZhDVsVAugNc7Yt074sKafkuo21RccFPRqmhstyCr
 3OPg==
X-Gm-Message-State: APjAAAVgc5ydg5pfBa5Y0k2F41IQWyASjv7dZkFJaCcbIVGYKW2SywW6
 lnbAiOBT5lsyDpxUwqvVtRrL7YMJCSHw1gCG
X-Google-Smtp-Source: APXvYqxkxhXEjx8ehUwO+4U+/PSwW95cfpd51BrO1CGROW1JbuARWLoPLbgzmMBGokFlEw6Kw7ByzaocLX6whXWc
X-Received: by 2002:aca:4341:: with SMTP id q62mr1665112oia.140.1559580959661; 
 Mon, 03 Jun 2019 09:55:59 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:13 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <f293884fad5f741b9202a9db6006f4bfdaedc2bd.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 11/16] drm/radeon,
 arm64: untag user pointers in radeon_gem_userptr_ioctl
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
 bh=J9pRn7M3NANi3nsm6t0U9rkGUXnmKvJ1SqswIr7oBNs=;
 b=uyCC5R6PocJkucx1jg/Ao87LrvuuxuIBF6MJgtDNhRfSLGfd93TT+616KNBdU1kmQ0
 AgUDtRxuemeCNPWARnIzmKXOHJHBg+nlDVnGcRWa1zFo9sO/boLQmVSMKTOceUEyeuWg
 mQemhEJH0YpA4zNTW5udZ12GKI5bnl80kC7VZlC60TPzrs4d4KpnJ4TkMFczujBnqjPI
 s1PIMD6Bv9mJiTZ+Ezsulw1mODRNfzAxvwpKccvPVlqp//q9tEM3ODpqGbBulPCkTHr1
 l2f+hVLNHUHhV92giHpjab5jQ7AF27XvPV9Duk2JrwjNtkOIOBAX18N6EpfDx4AK8S9m
 dKQg==
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
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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
cmd1bWVudHMuCgpJbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbiBNTVUgbm90aWZpZXIg
aXMgc2V0IHVwIHdpdGggYSAodGFnZ2VkKQp1c2Vyc3BhY2UgcG9pbnRlci4gVGhlIHVudGFnZ2Vk
IGFkZHJlc3Mgc2hvdWxkIGJlIHVzZWQgc28gdGhhdCBNTVUKbm90aWZpZXJzIGZvciB0aGUgdW50
YWdnZWQgYWRkcmVzcyBnZXQgY29ycmVjdGx5IG1hdGNoZWQgdXAgd2l0aCB0aGUgcmlnaHQKQk8u
IFRoaXMgZnVuY2F0aW9uIGFsc28gY2FsbHMgcmFkZW9uX3R0bV90dF9waW5fdXNlcnB0cigpLCB3
aGljaCB1c2VzCnByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBj
YW4gb25seSBieSBkb25lIHdpdGgKdW50YWdnZWQgcG9pbnRlcnMuCgpUaGlzIHBhdGNoIHVudGFn
cyB1c2VyIHBvaW50ZXJzIGluIHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bCgpLgoKU3VnZ2VzdGVk
LWJ5OiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CkFja2VkLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2dlbS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKaW5kZXggNDQ2MTdkZWM4MTgzLi45
MGViNzhmYjVlYjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dl
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCkBAIC0yOTEsNiAr
MjkxLDggQEAgaW50IHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLAogCXVpbnQzMl90IGhhbmRsZTsKIAlpbnQgcjsKIAorCWFyZ3MtPmFk
ZHIgPSB1bnRhZ2dlZF9hZGRyKGFyZ3MtPmFkZHIpOworCiAJaWYgKG9mZnNldF9pbl9wYWdlKGFy
Z3MtPmFkZHIgfCBhcmdzLT5zaXplKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuMjIuMC5y
YzEuMzExLmc1ZDc1NzNhMTUxLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
