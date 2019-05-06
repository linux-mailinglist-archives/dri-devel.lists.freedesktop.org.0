Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6115E15
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2EB89DA6;
	Tue,  7 May 2019 07:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0DD89A1E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:31:54 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id m76so6119642vkf.22
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E5WO9ODhUeb7gchIl3e11LSllsWmM1E2YpuEe+KMyVo=;
 b=t9EYQaSS+z3gwTH3jz3dMxY1TgCnR5Hbx0NK80jSvlTK+OnnYB0FRlqdCoCSQ71F5r
 ZrbaWH3ULnxoXeOI3tr4dGs2n22465DVwv3OtqUDYOy7dOMnSTndFt2oB8GT5FqvGp1J
 TBvJgkajzmJSGXj4QzKiu5XrafeNckQW81MHNeAVqSBY4sXq/yAA3/DUCUnS1UoCIsCL
 qYAkYawSqj8so5uIDNF4VTHvVkVKKMq3HZa3nrzjDjTKZuFIqS9aZjz85kNRfF8WQsss
 634Tq+ULpy2TVJJabJcf2zh8C9/OuMhFHRQS5vo7lJ4Fuj0u7xHavFS4MFEogfMGNDJb
 1b6A==
X-Gm-Message-State: APjAAAWzobG24ME0+7UAcmO1SS0cafl4an6KHccg8+EsjHqLC7Quxxm6
 PwI/lHqaTzp3cBqUwu42v1I0AnCb96np2zTK
X-Google-Smtp-Source: APXvYqw1xOoCnPO8YfwpZ5nRgaPpPr24xspNBV17LLiBFtD2eWt0/j9p08QSESkEcGjJ9SGNKNyhv8KaV3q9K4HX
X-Received: by 2002:a67:efcc:: with SMTP id s12mr4512139vsp.120.1557160313543; 
 Mon, 06 May 2019 09:31:53 -0700 (PDT)
Date: Mon,  6 May 2019 18:31:01 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <cdf0b98edefa9227db4a3d1fb6e3c7bc5a6a6215.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 15/17] tee, arm64: untag user pointers in tee_shm_register
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
 bh=E5WO9ODhUeb7gchIl3e11LSllsWmM1E2YpuEe+KMyVo=;
 b=ZAV3tC6ygeuQpYDYrKMnamvWU4Ola27jwmOvJT0NrB9zkA9/9VwZpqZILeD/kCkNoz
 2YieZRVMa/AXiEzwBIxCU1l+GEYmKclsxxyQTiWJfi3V4eZQV5Ty6cVbJ946qs6vtwua
 FnVZYy8h8LlcT9zEGoHGJFhxw76fNhlXkwiMMdgNAFJQ0fdrxIy60WNM3Dx5/MSJjbMm
 JoRnUusKGOL9DOHOG1d4lxStTE2KnFUHyp2053KQyza8HaWrD88UcCSEHERhBeycqSfG
 PaS1O1Y2zDlyyujLwl9tuNkVlIoFOsc0GRtgaeegMD911ZalfKNXqOUfZljQAA2/cuom
 1W3Q==
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
cmd1bWVudHMuCgp0ZWVfc2htX3JlZ2lzdGVyKCktPm9wdGVlX3NobV91bnJlZ2lzdGVyKCktPmNo
ZWNrX21lbV90eXBlKCkgdXNlcyBwcm92aWRlZAp1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3Vw
cyAodmlhIF9fY2hlY2tfbWVtX3R5cGUoKSksIHdoaWNoIGNhbiBvbmx5IGJ5CmRvbmUgd2l0aCB1
bnRhZ2dlZCBwb2ludGVycy4KClVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGhpcyBmdW5jdGlvbi4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4K
LS0tCiBkcml2ZXJzL3RlZS90ZWVfc2htLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZlcnMvdGVl
L3RlZV9zaG0uYwppbmRleCAwYjlhYjFkMGRkNDUuLjhlN2I1MmFiNmM2MyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy90ZWUvdGVlX3NobS5jCisrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwpAQCAtMjYz
LDYgKzI2Myw3IEBAIHN0cnVjdCB0ZWVfc2htICp0ZWVfc2htX3JlZ2lzdGVyKHN0cnVjdCB0ZWVf
Y29udGV4dCAqY3R4LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJc2htLT50ZWVkZXYgPSB0ZWVkZXY7
CiAJc2htLT5jdHggPSBjdHg7CiAJc2htLT5pZCA9IC0xOworCWFkZHIgPSB1bnRhZ2dlZF9hZGRy
KGFkZHIpOwogCXN0YXJ0ID0gcm91bmRkb3duKGFkZHIsIFBBR0VfU0laRSk7CiAJc2htLT5vZmZz
ZXQgPSBhZGRyIC0gc3RhcnQ7CiAJc2htLT5zaXplID0gbGVuZ3RoOwotLSAKMi4yMS4wLjEwMjAu
Z2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
