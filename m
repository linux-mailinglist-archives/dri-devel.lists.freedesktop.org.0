Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53866524B4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA56E082;
	Tue, 25 Jun 2019 07:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369A389BA5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:42 +0000 (UTC)
Received: by mail-vs1-xe4a.google.com with SMTP id b7so3917099vsr.18
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+QjTccShtmk/DNvEu2Adujr4/24uQqkMA4u/Npu2BdA=;
 b=mj/DgbLMuhNIAEuQl9dLrSbk60j3jj6OXar1/1vVtsT0m3U2VQYPcXPUjalcVxe3qq
 Isjc6LqFDBUGR69tJRwuvZO7iLaxBF3b6MEHd+dR5Le9PtERbhnoMa7hV5GZtGbdv/EI
 paONj+DkKQAHBbx6jsOLl1Ae9+b9F6pvLZe5Ff/zDmyRDCH4VCkxb4ftcZes8d5ydTO1
 0va1DuKl5XBZOFcE9zbWHoc4hkv4kRARbmBMUiO0+jmwtjTaCX9tFPiR5JVYK5BxYveJ
 HKx4g/qy55O8I5fe6eH9W1ZRrktuIVVdtjyBFO71luz0VA9WcEWeysn1mOzTG8Ra/TMX
 mIZw==
X-Gm-Message-State: APjAAAWfbCGvQLPjBxJc/NJka7+uw/nxbpADDbIN1rJa7rtYncMG038c
 /Mdz+GW4NfKPtgXSaUbKestUvA1joPsTmDX1
X-Google-Smtp-Source: APXvYqyUWW8huBSfbOwzfvyZrK53WvzmxiQ9by61ETLtrVtF59paHvOBrjS1vPlQyT8G9KXO3foj9yEr/dGEqynR
X-Received: by 2002:a1f:a887:: with SMTP id r129mr2036386vke.75.1561386821206; 
 Mon, 24 Jun 2019 07:33:41 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:56 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <ea0ff94ef2b8af12ea6c222c5ebd970e0849b6dd.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
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
 bh=+QjTccShtmk/DNvEu2Adujr4/24uQqkMA4u/Npu2BdA=;
 b=BuaO5811jnUX9zfd4G8ToBhrbhMJy0LzFmcX+sgB7AQM8NJvSv01OIt+sAqC0IYDFj
 O+VE+bcKl7xzCDnEKiecjcqkjUhFXSFgcq02fOM7s9XnYH4kbv5oATeSWl+tEWpHxjax
 uddXNBc9L6bsecbckcats1vGIj+FRm1AXB1jETFkmq7osCy5XjHt0r7A/MylVaoS7sEi
 BEqqQGEpCtD+G1DLTSJRrPX1jP7q6JLRto0o7pT68gHSfXhTroGbTpoKZNwyLPn4gBNV
 8ODVys95W2+g/mSu4Rja/qhLF+ras1jurnSxRwwt4QC/Gcz8iYCVwlkq+O0Dgaz38Z6X
 Qigg==
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
dHMuCgptbHg0X2dldF91bWVtX21yKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2
bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJz
LgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvaW5m
aW5pYmFuZC9ody9tbHg0L21yLmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5k
L2h3L21seDQvbXIuYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMKaW5kZXggMzU1
MjA1YTI4NTQ0Li4xM2Q5ZjkxN2YyNDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9o
dy9tbHg0L21yLmMKKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwpAQCAtMzc4
LDYgKzM3OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihzdHJ1
Y3QgaWJfdWRhdGEgKnVkYXRhLCB1NjQgc3RhcnQsCiAJICogYWdhaW4KIAkgKi8KIAlpZiAoIWli
X2FjY2Vzc193cml0YWJsZShhY2Nlc3NfZmxhZ3MpKSB7CisJCXVuc2lnbmVkIGxvbmcgdW50YWdn
ZWRfc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKIAkJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWE7CiAKIAkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwpAQCAtMzg2LDkg
KzM4Nyw5IEBAIHN0YXRpYyBzdHJ1Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihzdHJ1Y3Qg
aWJfdWRhdGEgKnVkYXRhLCB1NjQgc3RhcnQsCiAJCSAqIGNvdmVyIHRoZSBtZW1vcnksIGJ1dCBm
b3Igbm93IGl0IHJlcXVpcmVzIGEgc2luZ2xlIHZtYSB0bwogCQkgKiBlbnRpcmVseSBjb3ZlciB0
aGUgTVIgdG8gc3VwcG9ydCBSTyBtYXBwaW5ncy4KIAkJICovCi0JCXZtYSA9IGZpbmRfdm1hKGN1
cnJlbnQtPm1tLCBzdGFydCk7Ci0JCWlmICh2bWEgJiYgdm1hLT52bV9lbmQgPj0gc3RhcnQgKyBs
ZW5ndGggJiYKLQkJICAgIHZtYS0+dm1fc3RhcnQgPD0gc3RhcnQpIHsKKwkJdm1hID0gZmluZF92
bWEoY3VycmVudC0+bW0sIHVudGFnZ2VkX3N0YXJ0KTsKKwkJaWYgKHZtYSAmJiB2bWEtPnZtX2Vu
ZCA+PSB1bnRhZ2dlZF9zdGFydCArIGxlbmd0aCAmJgorCQkgICAgdm1hLT52bV9zdGFydCA8PSB1
bnRhZ2dlZF9zdGFydCkgewogCQkJaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkKIAkJCQlh
Y2Nlc3NfZmxhZ3MgfD0gSUJfQUNDRVNTX0xPQ0FMX1dSSVRFOwogCQl9IGVsc2UgewotLSAKMi4y
Mi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
