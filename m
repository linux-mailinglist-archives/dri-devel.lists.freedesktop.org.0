Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB4105D5
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AA989312;
	Wed,  1 May 2019 07:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21403891E2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 13:26:08 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id b7so7056926plb.17
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Qo5FEqXeJKdpmXvqV1aNmsvS1qf4QOcuAEvGRZnbU+I=;
 b=HW+Bf39t48rQp581zqUMjR074zk1er/ZPjJ5nx3MlTnl8gKkAMHlHD1SsRhRmbNzMT
 20mq9CvABLcLsKKRfF0vptD2kIyV7ekXXCpLGayaCSUVmWPGSaT9XD+dqvSTMsgDRxL/
 ywNOwrMMzmgtSFbJ8NLyY0NsesUL1LTgOG120METsElE3BFJZx7ir+6HZz6NJEgvZZve
 Lq/6agw/NlgR6VjU0LP1+4hoz7GWUjGI273XyxiwqePJrMSaq0Mspj/Oeiyg/sl7g6Nj
 OrGkB3vAS31yJtQdgW0YIhiGij98u8zSyz8WXR/8+ufZW2JSHtATYRkXme0ioqJHNo3e
 Mz0g==
X-Gm-Message-State: APjAAAVVZDWhZ1s91siKNFkk0fDsPtkE745kAt8ingSPzoJMKeZU//vQ
 hBHxHSjUChpmWcQAKsY/iScdMP/r6EHc3RA+
X-Google-Smtp-Source: APXvYqzC1lVWU3xOxPIpeGY1IySKfn9D9N99TINTSZcSwcwIPCbrd75tIMQec4oX3DSqqzuBnQc6miaAqMAhwGUH
X-Received: by 2002:a63:1d4f:: with SMTP id d15mr64183239pgm.347.1556630767405; 
 Tue, 30 Apr 2019 06:26:07 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:12 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <c9ef2282b1860e3ca6da28a4d599c24ff7147bb7.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 16/17] vfio/type1,
 arm64: untag user pointers in vaddr_get_pfn
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
 bh=Qo5FEqXeJKdpmXvqV1aNmsvS1qf4QOcuAEvGRZnbU+I=;
 b=WJvgA7FhPH4nnlwUD7/cK+UGsQvztnpEwl/EwgwpETKSn2jcm2n8vXAJ5vmz+updJQ
 hv5vQG7S1TSnGIvsNFWmNlDJOuMgBbHPDTDqE1/Q7BSkSWZGsQSxWFmbI9EyZ11RD35O
 PoWicUER0x2L/roTgi03inDjhawM/RefWqQ0HU9dp3Bfb6piRBIYbrmvMjy86XgTN3si
 Ctsvudz1bGthwFBvr6qlHQElPSiMTUZTlDJzHWjXIK5Av3TkDr+6XQPdcLfX/oczYas3
 y01MzwmNMMd59RGZLYJMIFoZY0gr9B1FAyRfwBPJvm7Zd8dDqsp5xcnwSnBCo7S+GHIh
 eAtA==
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
IAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOC1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
