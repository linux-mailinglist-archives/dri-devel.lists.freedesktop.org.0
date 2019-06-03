Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D12E33FA9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1FE896FA;
	Tue,  4 Jun 2019 07:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846968914C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:50 +0000 (UTC)
Received: by mail-ot1-x349.google.com with SMTP id g22so9214128otp.17
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZBmZ0AJkpI6Le2BTudY9LfSDHiJInTNRilsGVrjkAC4=;
 b=IiWmC3oOOVM8/4+rWOB0o1kSdScE+l1T0eRxpYeDbwI5FCRK6Vzk6A2VqZxjPR+9yd
 lPBM9tHekD+5nc4he0bcUa1WbT/qcstQKCu3UY2dnBbu2h1ieoiQWvBjpF9dVAAYSpgT
 Ayh1ceTbNNg5ZXjoGOrkbvVP1Lr7jPVuTXHjR+P0SD8thCV9a/qprE3TV6mkRIV/sZ6E
 VWE3XoN/fxcfyAozD1QEMZ8RjC2x4MnzQNebCFXK6kp1MJaZAoT4vc8FTvFiiUFJHw4C
 TodnfZbUrTF0qiFWoNy4CUG7qWpUmhEZ2twWAw8/supXh4PecxXpJ+Jk9Pj1VmwZzGXc
 9tVg==
X-Gm-Message-State: APjAAAX3UnPP+h6DXzdhw4Wuc/B1vmM3PPM6GTn71u4v1HV1nKx6C9Fy
 Xi77S1VJL2y14OZgLsgIUvppGmR+6z53CyJx
X-Google-Smtp-Source: APXvYqy+jD2zPLosNFGdbJ9ezUNMRGpcmbF5VcOnmGNGlPs/hbYWUHg1PJfAxR5NSiop2ABNMtv5Bkf3tC6COzAd
X-Received: by 2002:aca:4c3:: with SMTP id 186mr1626180oie.12.1559580949610;
 Mon, 03 Jun 2019 09:55:49 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:10 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <51f44a12c4e81c9edea8dcd268f820f5d1fad87c.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 08/16] fs, arm64: untag user pointers in copy_mount_options
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
 bh=ZBmZ0AJkpI6Le2BTudY9LfSDHiJInTNRilsGVrjkAC4=;
 b=URpy1zkCsiHDZT4QO7sl51daLEh3EGQ+QBRWhBXCE891aX0bBPmoAKSOA31jx1eR/L
 lVC6wRB0VJkhYxePvRUt+LMH36W5FFHQFgoa3GPev4OVYVi3rHZ7c3DIf31iffj+WRWq
 O/UwDncv5Fut/rLbuSahvZjC3AOwYT8i5PrP8W6A3ApbgszBZnpxe6Ijm9sVziVKebM1
 iMXDrWTNGRgrpGSzVkD4uXSftJythbi88SDUBif5NioLplX3HzpUrRyFyzSWH4dNAKRr
 WMIQ2F6id96lYcVo97o9s2zuDCTDHymNEv75yNnQamJ6cKIMShowZNQgGMTsd3D7DLBr
 FGuQ==
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
cmd1bWVudHMuCgpJbiBjb3B5X21vdW50X29wdGlvbnMgYSB1c2VyIGFkZHJlc3MgaXMgYmVpbmcg
c3VidHJhY3RlZCBmcm9tIFRBU0tfU0laRS4KSWYgdGhlIGFkZHJlc3MgaXMgbG93ZXIgdGhhbiBU
QVNLX1NJWkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90CmFsbG93IHRoZSBleGFjdF9j
b3B5X2Zyb21fdXNlcigpIGNhbGwgdG8gY3Jvc3MgVEFTS19TSVpFIGJvdW5kYXJ5LgpIb3dldmVy
IGlmIHRoZSBhZGRyZXNzIGlzIHRhZ2dlZCwgdGhlbiB0aGUgc2l6ZSB3aWxsIGJlIGNhbGN1bGF0
ZWQKaW5jb3JyZWN0bHkuCgpVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJhY3RpbmcuCgpS
ZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KU2ln
bmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0K
IGZzL25hbWVzcGFjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvbmFtZXNwYWNlLmMgYi9mcy9uYW1lc3BhY2Uu
YwppbmRleCBiMjY3NzhiZGMyMzYuLjJlODU3MTJhMTllZCAxMDA2NDQKLS0tIGEvZnMvbmFtZXNw
YWNlLmMKKysrIGIvZnMvbmFtZXNwYWNlLmMKQEAgLTI5OTMsNyArMjk5Myw3IEBAIHZvaWQgKmNv
cHlfbW91bnRfb3B0aW9ucyhjb25zdCB2b2lkIF9fdXNlciAqIGRhdGEpCiAJICogdGhlIHJlbWFp
bmRlciBvZiB0aGUgcGFnZS4KIAkgKi8KIAkvKiBjb3B5X2Zyb21fdXNlciBjYW5ub3QgY3Jvc3Mg
VEFTS19TSVpFICEgKi8KLQlzaXplID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpZGF0YTsK
KwlzaXplID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpdW50YWdnZWRfYWRkcihkYXRhKTsK
IAlpZiAoc2l6ZSA+IFBBR0VfU0laRSkKIAkJc2l6ZSA9IFBBR0VfU0laRTsKIAotLSAKMi4yMi4w
LnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
