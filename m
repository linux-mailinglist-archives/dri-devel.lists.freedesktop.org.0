Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD3105C4
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AC189322;
	Wed,  1 May 2019 07:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68FC891E2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 13:26:04 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id s11so12836933ywa.18
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5vVbThWFeNTYFxwbQq67jdT1oZny+xOKBFoxX+2Uk7M=;
 b=KRbCiRALHu2EDBvrjr7fptCfddqX+Kyhq317oD1fQFACm3stoKJEthXsqGn2nGk3kP
 rSFiYPzxOcNgwtnYysO0HHuoVvudnndyuOT8+zgYoSU9p23CpnKgojeRzG5RXHhRZQLY
 dEb934ZK9BUzvmchzEqgI9gsPYJGH5udNEcNWzFJqD41TQQ4++SrdTxQqSADBp4Jrasr
 HNAyITShY25Z5L3zTjO9yQk4rGr8/WFHjuVdxz1NwAcdzuqZTXTmzsJapD/P4VFAJwqZ
 eH74JM6YlNECx8A883BTSNrZ7actWtZ8r11EqmIHj2JZcpH5fpTzdQyYea8rvtuYvmU9
 CvdQ==
X-Gm-Message-State: APjAAAVdpxmwVq0TuvTWJdOt2pRelKOPriRowpO/ESlYlx8C+q0JE2hT
 8VXk4mkTuEAEDNpPypaEqkCfQxijVD0mK/89
X-Google-Smtp-Source: APXvYqyv8kHiq9IuRt8k8uxL630nsRVEEuszbAKJggJOMl5SWFBjzMAnW0IWxRwAYYoqlPXLLWZ5sEsVnC5FF0Vx
X-Received: by 2002:a81:3c89:: with SMTP id
 j131mr56890450ywa.183.1556630764032; 
 Tue, 30 Apr 2019 06:26:04 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:11 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <1b2a46dbfa24bde41f11cff6f53683a5ea5915c7.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 15/17] tee, arm64: untag user pointers in tee_shm_register
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Wed, 01 May 2019 07:18:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=5vVbThWFeNTYFxwbQq67jdT1oZny+xOKBFoxX+2Uk7M=;
 b=FRME1COezh5b+xsqn4P+Wuk9kST7usWvir2xQhAmIzYbqhd+Dle1XM/PaJl5NwGBwF
 z7/SMrTqJtHy/gO4CF7xbqlFAwpIk8PwR9mnXkXEY1b5HFuyeguAZJRX9uVnCx/+N6Cg
 GdXjue/eQFQ6wfKzJUzNubo15IJ6ki/RwkeGwPRaQhUCcsmSJMlmZ6DdqtqFu3fOL0bX
 01e0qP9aKT8hITIugatecY8TuWXLv4w13ho7n2rx3qvyQwxwSmnnV+ESWDP6rPMjBLm6
 9em8VBa1zwsikfNNQo9I2iNQIYFHDIjY+xXevJ0y76Ma6MtOAyKoTjWTXLT8lERzPHTd
 0Kew==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
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
ZXQgPSBhZGRyIC0gc3RhcnQ7CiAJc2htLT5zaXplID0gbGVuZ3RoOwotLSAKMi4yMS4wLjU5My5n
NTExZWMzNDVlMTgtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
