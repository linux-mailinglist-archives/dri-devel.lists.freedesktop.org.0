Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE533FB6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10441896C4;
	Tue,  4 Jun 2019 07:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373989024
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:46 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id x68so992788qka.6
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/k2k5Ar8aCCQf+9D9Tu+JwXv9rH7AXQNa2sn1Y51ZQ4=;
 b=ZpH83wtGyfSj8k0X1p7WPTvVtMwm571i1zE0We1FAxA0Ugh6oZP4KJIoIu1Iu3lTF4
 U3nnoajcsUSwtjfVfLiKcyj+vRvlmwZDG7vz1mggxcqVSljw+4vuhvZjHQ69kNjDTRpC
 96/j6taEvTMPh8QcBqBoSYrCSOWi/hmf9J/j1ay37NSnLvCRCu0crYF8VPAkXTHJm5fX
 of6MUS7cwTLFdc5CIEQr6zoGBCF1DvKPwkPlD0cIP2A8j9hqsCoF911crwuzIC34O7DU
 kSOTm5ww+/vcTI3PPgvs18QV/GF97xGw1l+sHxigPL/NnWjZ46SQXeZaWRL9+S+Xb96p
 hQwg==
X-Gm-Message-State: APjAAAW4EuYGKaVqeTFdNsqFJVSE51x1XtB/9eGVcJloeokx+kW8HFmI
 6sbEeSpZC86eKjAZLSFCor91j4R9hS0O/jX7
X-Google-Smtp-Source: APXvYqwZjlBwbqsUyeG8rZrRtMFJQ4x0s68oHB37CApZiK1GoR+JjJPXBY4ob8DyF+o+kojgj7/dpioneK7jLRPa
X-Received: by 2002:a0c:b5c5:: with SMTP id o5mr3845483qvf.6.1559580946056;
 Mon, 03 Jun 2019 09:55:46 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:09 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 07/16] mm, arm64: untag user pointers in get_vaddr_frames
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
 bh=/k2k5Ar8aCCQf+9D9Tu+JwXv9rH7AXQNa2sn1Y51ZQ4=;
 b=MjNLlQZlNit0qhAOpvEzanta6aMm/HnKYesq3iqhkQTbbVYKucWsuURNV/pZ0fdIgr
 1ylaKkgQteB/frXQLyR10kOE8zU+ZyRD8TpKfDcQZGCnFFNsjXxOEavz8cj17GKJRCyB
 J2x5kMGyd9MMKiWAlK7ocfm8aGFbZzr0Rdh98fVFvwjIhfiuVXpvvAuYt2OnDM/XCpZC
 VWufB4qSPQOsK3r33NC8xnn++nCnsO734V+hLJqo/vulWZ1igyxoTiVpIzF6BQyRc9HL
 xirXgN3vt5YoqdUqHeQ92rql4obffE5Q5C/gZo+mx+uqLs8kG3FDDu05FA2VnYDjJKl9
 Kwrg==
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
cmd1bWVudHMuCgpnZXRfdmFkZHJfZnJhbWVzIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBm
b3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgpvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2lu
dGVycy4gSW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdpbmcKYWxsIGNhbGxlcnMgb2YgdGhp
cyBmdW5jdGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogbW0vZnJhbWVfdmVjdG9y
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
bW0vZnJhbWVfdmVjdG9yLmMgYi9tbS9mcmFtZV92ZWN0b3IuYwppbmRleCBjNjRkY2E2ZTI3YzIu
LmM0MzFjYTgxZGFkNSAxMDA2NDQKLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMKKysrIGIvbW0vZnJh
bWVfdmVjdG9yLmMKQEAgLTQ2LDYgKzQ2LDggQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKIAlpZiAoV0FSTl9PTl9PTkNF
KG5yX2ZyYW1lcyA+IHZlYy0+bnJfYWxsb2NhdGVkKSkKIAkJbnJfZnJhbWVzID0gdmVjLT5ucl9h
bGxvY2F0ZWQ7CiAKKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOworCiAJZG93bl9yZWFk
KCZtbS0+bW1hcF9zZW0pOwogCWxvY2tlZCA9IDE7CiAJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0
aW9uKG1tLCBzdGFydCwgc3RhcnQgKyAxKTsKLS0gCjIuMjIuMC5yYzEuMzExLmc1ZDc1NzNhMTUx
LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
