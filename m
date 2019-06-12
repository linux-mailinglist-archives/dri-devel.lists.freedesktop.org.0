Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A754336B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51728931F;
	Thu, 13 Jun 2019 07:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00AF8930B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:21 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id n190so13532013qkd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dC40GuuRrFkQnjrApJXQmFxRiKKrkesKJBcqRTZL8Hw=;
 b=ZmXFr4CkDHjOs+EHx1zNeSeLG+cKaHIlvdr1NdjHE3IzBZwcsIl/sbK8WtuWAMRG1+
 Cr88FgSw4HroPWDTRneDQuMn0Mm54IaZza9Rs+iJv7UdC2jx7Qgyxu8yANqgq3RfYQ1D
 9+YAqqSBWbaT29d3EhC5wdTx3uCrcJf3TqGKVhqOd9+KTL6IdGHwrFga7NsJ7Fpkd18B
 UOMQ29fGTjHhqehmAxI/nHRLwPPDhR8GyeKCQYB8Yv+nyH6LW08NCoACKLGwAXt9tRcR
 HCHxJYJF9gyTYGK0XCd0SjqR9jgUQ9F9/94rSV71OafGVJ7Vd9u/Q7P1ITCX08Ax66tT
 e3Dg==
X-Gm-Message-State: APjAAAU2RFyoaBLR6qfCFdV9Ppq+E13q6wtGSSyWMDtyo40rplHLFNWz
 LBYCrkk9/7H2QhyeAkvYClHf0Y0TqwRwI7/i
X-Google-Smtp-Source: APXvYqwZjeFH8QvU8JlQ9TXNVd73FVhiQa5kjrzjuBPKvVuXz62UTyjAI0ty22a00jJqk9SVHlzrZWd7SRmSPg0y
X-Received: by 2002:ac8:30c4:: with SMTP id w4mr67672128qta.314.1560339860763; 
 Wed, 12 Jun 2019 04:44:20 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:31 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <e86d8cd6bd0ade9cce6304594bcaf0c8e7f788b0.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 14/15] vfio/type1,
 arm64: untag user pointers in vaddr_get_pfn
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=dC40GuuRrFkQnjrApJXQmFxRiKKrkesKJBcqRTZL8Hw=;
 b=l++ZaaCoh/Va878Z1RknZZDdHUxfk157JnrRAUHz0jkL8fnv4FiiLmIp7Mk+/+dj5Z
 udFWoFOVhW7criNi8EMt8LBSnQaHvMhhUZ7BDvFNW7/H/rP4O9cpUiWmbFdx7WqJb0YL
 NYshnqAqHIeJqfZE1jL/Or9LTpuDIXYOfI1A2lvZRf82GFgwU4vOl8q53aA7Al9b8vAL
 /40xfjd6Br1Z56pIH7ZQuk9+yAf8Fr4GxAKL+l48BRvqpFH3utDdPvwMyQ57y2D4Zbcd
 AbEKWCBEQKFZuNPc6Vhcbi8LrlZtqOM5E/akcRiPUbRsuxCCoPgb7uahyTdqK4vvCrOk
 BhgQ==
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
cmd1bWVudHMuCgp2YWRkcl9nZXRfcGZuKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZv
ciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKUmV2aWV3ZWQtYnk6
IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+ClJldmlld2VkLWJ5OiBL
ZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtv
bm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lv
bW11X3R5cGUxLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92
ZmlvX2lvbW11X3R5cGUxLmMKaW5kZXggM2RkYzM3NWU3MDYzLi41MjhlMzlhMWMyZGQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKKysrIGIvZHJpdmVycy92Zmlv
L3ZmaW9faW9tbXVfdHlwZTEuYwpAQCAtMzg0LDYgKzM4NCw4IEBAIHN0YXRpYyBpbnQgdmFkZHJf
Z2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAogCWRv
d25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAorCXZhZGRyID0gdW50YWdnZWRfYWRkcih2YWRkcik7
CisKIAl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0sIHZhZGRyLCB2YWRkciArIDEpOwog
CiAJaWYgKHZtYSAmJiB2bWEtPnZtX2ZsYWdzICYgVk1fUEZOTUFQKSB7Ci0tIAoyLjIyLjAucmMy
LjM4My5nZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
