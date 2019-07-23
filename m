Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11871EF1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50D6E33D;
	Tue, 23 Jul 2019 18:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAD16E329
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:39 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id p18so32564878ywe.17
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JHpRt1iV1Yui2063ArtK5NZw3fPfTbQsXHZ/X8tSe2c=;
 b=Y5EwKabYtouaiGGkgcwqJACsRfOMBfFJxC6arE7guGSJkj3VrvgRNj70gcoxjCJ1mf
 yqz06HS9Br1fOM6QMhaVidaeJA7cvr3YKJusGVSo/lAyEncIw0wmrlPRlV7d0MUVNiOn
 7BgiX5GceZLtQSHoykARUK6Evl+FNJMQSyl1LSlVSo1KAvFy96e4B3rMUQAO5DCEdEys
 aM3XoS69gcoPs7H4RXpLW+uuGUJYs4G/12YZgyE8Y2ebsBcPeN7HS11WaM/taZ3wPDO1
 vGMMRzSnJGFDIDx6AYJF08vdveDUPEllF4cadztb92c5IAV0dqVuStrX9jkIaDVmwY5h
 12lg==
X-Gm-Message-State: APjAAAXRGjBOZMJ1TsplzVd6KcxRfv8VyRow8p9Wkyfx1CYF/JbCsztf
 QSk8zxW1YdxbpLRvlgm0hgo3CVN/8q4heBSt
X-Google-Smtp-Source: APXvYqzQ4z/ZiuFK+6sqRZERC5QgYRRFA4U1Dnbp9V3f1PKQeQRLZSu3TG/nr3g90hvkMvcrT8eNvmOVLDqS9X26
X-Received: by 2002:a0d:d616:: with SMTP id y22mr43437325ywd.365.1563904778592; 
 Tue, 23 Jul 2019 10:59:38 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:47 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <c856babeb67195b35603b8d5ba386a2819cec5ff.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 10/15] drm/radeon: untag user pointers in
 radeon_gem_userptr_ioctl
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:19:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=JHpRt1iV1Yui2063ArtK5NZw3fPfTbQsXHZ/X8tSe2c=;
 b=a1WmmrmprQZ/rcrg4bnGXYSWuW8VRJo8q/rb7ZTLQKZa1K7I67ixfos045Wbs17Hsc
 4ubobzNkIuAipJMS7ZPZPbwqhOEcQBYGSdXPH8NmRc6nBI3x8EfWx1KUwQ8GdoHMrOVu
 pQBBRoSlOoWQvrJK6Ndgh0M+u5SrtS+Z7XLFtzHXYzmOZcoQreZcqxEy8gyvJGE0ittV
 1ErCh2wjdbyE4mfBH/bts1VkhHwv8KlRuO+94TszgBwo8vjAMA7AFwRnm9ELenbWUlad
 Ar6m6acLtYRugfggNK1CttVM0dqBedFHVAahPgUmqPuarVGgg9aYEhjvXatkNn9RUbXS
 DjvQ==
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
dHMuCgpJbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbiBNTVUgbm90aWZpZXIgaXMgc2V0
IHVwIHdpdGggYSAodGFnZ2VkKQp1c2Vyc3BhY2UgcG9pbnRlci4gVGhlIHVudGFnZ2VkIGFkZHJl
c3Mgc2hvdWxkIGJlIHVzZWQgc28gdGhhdCBNTVUKbm90aWZpZXJzIGZvciB0aGUgdW50YWdnZWQg
YWRkcmVzcyBnZXQgY29ycmVjdGx5IG1hdGNoZWQgdXAgd2l0aCB0aGUgcmlnaHQKQk8uIFRoaXMg
ZnVuY2F0aW9uIGFsc28gY2FsbHMgcmFkZW9uX3R0bV90dF9waW5fdXNlcnB0cigpLCB3aGljaCB1
c2VzCnByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBjYW4gb25s
eSBieSBkb25lIHdpdGgKdW50YWdnZWQgcG9pbnRlcnMuCgpUaGlzIHBhdGNoIHVudGFncyB1c2Vy
IHBvaW50ZXJzIGluIHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bCgpLgoKUmV2aWV3ZWQtYnk6IEto
YWxpZCBBeml6IDxraGFsaWQuYXppekBvcmFjbGUuY29tPgpSZXZpZXdlZC1ieTogS2VlcyBDb29r
IDxrZWVzY29va0BjaHJvbWl1bS5vcmc+ClN1Z2dlc3RlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+CkFja2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252
bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZ2VtLmMKaW5kZXggZDhiYzVkMmRmZDYxLi44OTM1MzA5OGI2MjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2dlbS5jCkBAIC0yOTYsNiArMjk2LDggQEAgaW50IHJhZGVvbl9nZW1f
dXNlcnB0cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXVpbnQz
Ml90IGhhbmRsZTsKIAlpbnQgcjsKIAorCWFyZ3MtPmFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFyZ3Mt
PmFkZHIpOworCiAJaWYgKG9mZnNldF9pbl9wYWdlKGFyZ3MtPmFkZHIgfCBhcmdzLT5zaXplKSkK
IAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuMjIuMC43MDkuZzEwMjMwMjE0N2ItZ29vZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
