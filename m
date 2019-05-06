Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248E15E1E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0445889E01;
	Tue,  7 May 2019 07:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A73F89AB5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:31:48 +0000 (UTC)
Received: by mail-ot1-x349.google.com with SMTP id k90so7744725otk.21
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BvoYtYVsULamnYvbwO19c3h5oHA1gsMsAv5tZYbLYtI=;
 b=jsp5RfmdMWnVH1hp3rA+VV3ozX5EOmamR/q0OkVrFyIPuO4IiYVWc+gKLvj2iK+8Jl
 hTmHgYINK40XunwYkcMjQy/Ke78XZCQGucapkdPAKH8ta/Nbip01ksaeZdYFD1KyyTO1
 Vr2qElWraHfr2cKUqJWIkWeYvLi1gLndkzGFqdRrvTWN2aqxNOVLo+V8LHmqSdskeoRA
 UM/zVk0McX7U0/HPocXpL7cbqU8up3lPCslpnzE6YKuhQQMmfKppyet4KhSJOkHcauYl
 zivajjcVCDMQP+TM6F+9SXISvoMU2yUiBV24Ggk5RUpwxronhR3DsNBhppd8RfFg1L/S
 HD2A==
X-Gm-Message-State: APjAAAXKh1ZAd1W/f2dVnzXsWbUco0w7hGCoQfUfshhkLO3vhYpGDGbz
 sgygnp2CKiwm1J5LZ8/8NrR5n0OjOEBUdnBv
X-Google-Smtp-Source: APXvYqy3zk1gAf1HD3ERPdP+fu/IbJWPYjnwXEpH7KM/4Kolrw9tSDmooPMwqXT4nvIVhZWlBkow5/TqTCzeTPOv
X-Received: by 2002:a9d:6008:: with SMTP id h8mr18251374otj.55.1557160307352; 
 Mon, 06 May 2019 09:31:47 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:59 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <66d044ab9445dcf36a96205a109458ac23f38b73.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 13/17] IB,
 arm64: untag user pointers in ib_uverbs_(re)reg_mr()
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
 bh=BvoYtYVsULamnYvbwO19c3h5oHA1gsMsAv5tZYbLYtI=;
 b=hn4rH9KTek8R37jjBWMcf/SnTi9wO6imyjbK43Qo3YFFy0w0QB9ppRC7K8TE7v3vlN
 nPLbzWoXhcOl9RZZTW0CT+GOCLOJRZHlTgH0IFE90/0mo3gA6Benvmv0xM9qlEM2L7iM
 a5/5EdryhXK5o1zmP38+JskPbuvRNi2KBDqgGoYwdgZckW/t0t3zXYlgA28tCgQWx38p
 zeMjQt/2TKtd8YWaOZqpDqkiV1tfPRGdf11R4Vmzgti01WpJ/ug4M22kRPfo4KNLvnrQ
 G8KQ2Dx3TZLoioP3vZYIMjrpzIYzmaefwwMqniR4qNzu+AscTWd9F/aHBCgCKh66bnIf
 LcNw==
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
cmd1bWVudHMuCgppYl91dmVyYnNfKHJlKXJlZ19tcigpIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50
ZXJzIGZvciB2bWEgbG9va3VwcyAodGhyb3VnaAplLmcuIG1seDRfZ2V0X3VtZW1fbXIoKSksIHdo
aWNoIGNhbiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KClVudGFnIHVzZXIg
cG9pbnRlcnMgaW4gdGhlc2UgZnVuY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92
YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3Jl
L3V2ZXJic19jbWQuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyBiL2RyaXZl
cnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYwppbmRleCAwNjJhODZjMDQxMjMuLjM2ZTdi
NTI1NzdkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5j
CisrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYwpAQCAtNzA4LDYgKzcw
OCw4IEBAIHN0YXRpYyBpbnQgaWJfdXZlcmJzX3JlZ19tcihzdHJ1Y3QgdXZlcmJzX2F0dHJfYnVu
ZGxlICphdHRycykKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJY21kLnN0YXJ0ID0gdW50
YWdnZWRfYWRkcihjbWQuc3RhcnQpOworCiAJaWYgKChjbWQuc3RhcnQgJiB+UEFHRV9NQVNLKSAh
PSAoY21kLmhjYV92YSAmIH5QQUdFX01BU0spKQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtNzkw
LDYgKzc5Miw4IEBAIHN0YXRpYyBpbnQgaWJfdXZlcmJzX3JlcmVnX21yKHN0cnVjdCB1dmVyYnNf
YXR0cl9idW5kbGUgKmF0dHJzKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwljbWQuc3Rh
cnQgPSB1bnRhZ2dlZF9hZGRyKGNtZC5zdGFydCk7CisKIAlpZiAoY21kLmZsYWdzICYgfklCX01S
X1JFUkVHX1NVUFBPUlRFRCB8fCAhY21kLmZsYWdzKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAK
Mi4yMS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
