Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3EA43389
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003548945B;
	Thu, 13 Jun 2019 07:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A9D8930F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:43:40 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id s9so14408381qtn.14
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pF1pY6g9sgHe6SSJdZReBxN/hHHz/1mBqQ4jLohhQOE=;
 b=PdhDn6C9NbJx/do8AIyd/bcHOYtJPlZuLAL5bNfJGU2Htw6ISlTJI4yWPg3u6Gda9B
 V5mhTsWJQNgCuh2u+Ueu1Jc2cCzynCM56xKOrjmDls1AQffGCzT6vJV3jn5U8MB3PkpL
 yW6tBB3piBur85hQdyVy03Lo/JFm6xRrhQlwRYwLSQAykAnrn0W0G44VhPT0Hj9j6vur
 VLgSHHqWIFLCCDeViliidX0zBwu+8DOAe3CXjVwLytI8Tw9ynCjZqwiYcdp6DHfOhFZ0
 ecq+Bi7sJoFa75ieAoE5xnUNKnqGN0ycx3n7cjIbH0eZW0QEHYPS+HlWSVmrAE2x5wNe
 eN7g==
X-Gm-Message-State: APjAAAXzkg4TfsghT4KU9FWPk5bBnE0X50ev1gQu7S3M3Iil6eDGRSdI
 dEuY6oMeETGJ6h80RgVOfxLkYERZiESDisOY
X-Google-Smtp-Source: APXvYqwDKTUvtDmA6SMmQkKz65W969SZufp61k02G9fCL+2/fp67qf94d2M1YkNH+hXtOrCQMRSpsi3TuTa5t/Fk
X-Received: by 2002:a37:6b42:: with SMTP id g63mr50597391qkc.80.1560339819968; 
 Wed, 12 Jun 2019 04:43:39 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:18 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <9ed583c1a3acf014987e3aef12249506c1c69146.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 01/15] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=pF1pY6g9sgHe6SSJdZReBxN/hHHz/1mBqQ4jLohhQOE=;
 b=iMRCrqRsfaLBvoWwOfr75mSJ/VPfvlbAFbDtrOANqSuL+z1aGCJpTI0vsQBJ49zvkV
 9E9fBJ+sa0296EIJ5umEi+BHGLGKU1WldUfLsc5lzjtqovn6xo5wnnj4Lmb0O9PgfLXm
 rcwLyJjNEekU9EtCutlVconxtA95VHk5TlDWuAVOA+JWDgv52TV4yWWRYEX7ZgqRnURM
 Eul1F8JBswSLtsZ6lUMRapd1H2weXhkqX5JahODOopa1MhAlxblNV2Op319cxPCbAAUf
 9L64VhEstL8JTyQhso+M/6lNjrHhHWa2qS+F7je7+fvMkiPQ8oGbPBPAqN2Cie9HgxaI
 uOrg==
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
cmd1bWVudHMuCgpjb3B5X2Zyb21fdXNlciAoYW5kIGEgZmV3IG90aGVyIHNpbWlsYXIgZnVuY3Rp
b25zKSBhcmUgdXNlZCB0byBjb3B5IGRhdGEKZnJvbSB1c2VyIG1lbW9yeSBpbnRvIHRoZSBrZXJu
ZWwgbWVtb3J5IG9yIHZpY2UgdmVyc2EuIFNpbmNlIGEgdXNlciBjYW4KcHJvdmlkZWQgYSB0YWdn
ZWQgcG9pbnRlciB0byBvbmUgb2YgdGhlIHN5c2NhbGxzIHRoYXQgdXNlIGNvcHlfZnJvbV91c2Vy
LAp3ZSBuZWVkIHRvIGNvcnJlY3RseSBoYW5kbGUgc3VjaCBwb2ludGVycy4KCkRvIHRoaXMgYnkg
dW50YWdnaW5nIHVzZXIgcG9pbnRlcnMgaW4gYWNjZXNzX29rIGFuZCBpbiBfX3VhY2Nlc3NfbWFz
a19wdHIsCmJlZm9yZSBwZXJmb3JtaW5nIGFjY2VzcyB2YWxpZGl0eSBjaGVja3MuCgpOb3RlLCB0
aGF0IHRoaXMgcGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBl
cmZvcm0gdGhlCmNoZWNrcywgYnV0IHRoZW4gcGFzc2VzIHRoZW0gYXMgaXMgaW50byB0aGUga2Vy
bmVsIGludGVybmFscy4KClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KUmV2aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5j
b20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNv
bT4KLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDEwICsrKysrKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCBlNWQ1ZjMxYzZkMzYuLmRmNzI5YWZjYTBiYSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKKysrIGIvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTczLDYgKzczLDggQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIF9fcmFuZ2Vfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsIHVuc2lnbmVkIGxv
bmcgc2kKIHsKIAl1bnNpZ25lZCBsb25nIHJldCwgbGltaXQgPSBjdXJyZW50X3RocmVhZF9pbmZv
KCktPmFkZHJfbGltaXQ7CiAKKwlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKKwogCV9fY2hr
X3VzZXJfcHRyKGFkZHIpOwogCWFzbSB2b2xhdGlsZSgKIAkvLyBBICsgQiA8PSBDICsgMSBmb3Ig
YWxsIEEsQixDLCBpbiBmb3VyIGVhc3kgc3RlcHM6CkBAIC0yMjYsNyArMjI4LDggQEAgc3RhdGlj
IGlubGluZSB2b2lkIHVhY2Nlc3NfZW5hYmxlX25vdF91YW8odm9pZCkKIAogLyoKICAqIFNhbml0
aXNlIGEgdWFjY2VzcyBwb2ludGVyIHN1Y2ggdGhhdCBpdCBiZWNvbWVzIE5VTEwgaWYgYWJvdmUg
dGhlCi0gKiBjdXJyZW50IGFkZHJfbGltaXQuCisgKiBjdXJyZW50IGFkZHJfbGltaXQuIEluIGNh
c2UgdGhlIHBvaW50ZXIgaXMgdGFnZ2VkIChoYXMgdGhlIHRvcCBieXRlIHNldCksCisgKiB1bnRh
ZyB0aGUgcG9pbnRlciBiZWZvcmUgY2hlY2tpbmcuCiAgKi8KICNkZWZpbmUgdWFjY2Vzc19tYXNr
X3B0cihwdHIpIChfX3R5cGVvZl9fKHB0cikpX191YWNjZXNzX21hc2tfcHRyKHB0cikKIHN0YXRp
YyBpbmxpbmUgdm9pZCBfX3VzZXIgKl9fdWFjY2Vzc19tYXNrX3B0cihjb25zdCB2b2lkIF9fdXNl
ciAqcHRyKQpAQCAtMjM0LDEwICsyMzcsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fdXNlciAq
X191YWNjZXNzX21hc2tfcHRyKGNvbnN0IHZvaWQgX191c2VyICpwdHIpCiAJdm9pZCBfX3VzZXIg
KnNhZmVfcHRyOwogCiAJYXNtIHZvbGF0aWxlKAotCSIJYmljcwl4enIsICUxLCAlMlxuIgorCSIJ
Ymljcwl4enIsICUzLCAlMlxuIgogCSIJY3NlbAklMCwgJTEsIHh6ciwgZXFcbiIKIAk6ICI9JnIi
IChzYWZlX3B0cikKLQk6ICJyIiAocHRyKSwgInIiIChjdXJyZW50X3RocmVhZF9pbmZvKCktPmFk
ZHJfbGltaXQpCisJOiAiciIgKHB0ciksICJyIiAoY3VycmVudF90aHJlYWRfaW5mbygpLT5hZGRy
X2xpbWl0KSwKKwkgICJyIiAodW50YWdnZWRfYWRkcihwdHIpKQogCTogImNjIik7CiAKIAljc2Ri
KCk7Ci0tIAoyLjIyLjAucmMyLjM4My5nZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
