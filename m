Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F79524A5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA01D6E027;
	Tue, 25 Jun 2019 07:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1864F89B66
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:24 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id s145so6439147vke.18
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6wOlIN9RCqtC4EMjbsO9NIyMZhz6XW377zGYJAhhjSw=;
 b=YBL2QwhV8NA0HWcS08vLAWw+zuo/6anmzI/U+e8ZKydSa6/3oCko+k0roulvx7G0gd
 RWKk69xz2SRHLIHb438tSl4ekIQu2IuW0nIH0n8bZ7tbJ4pw2i75rUrJ26h8JNlV9Qos
 i+yY6fb+LWT0PMttJS5WxneDJTEbTDxA8DT71g9NdO3skO53suQuPWSjUj6a9LjpZKuO
 Nszr45lCOiCXNewejpuJLjaffzmpmT42gRtQaKvoBQhTPDNAnNBTmHeLNRvkVHtrMUPt
 HqfDVClZmkdE3sOMBfbC/SoBgyAfpLCYPs3dabiB8Old/21rQiPsfWi7w8m8m0ZCVZ5/
 Jl5Q==
X-Gm-Message-State: APjAAAV5iiay2p0WTBbmtj868D3Dx9K/LscnX620sbfdKCeMnq3efUz9
 KjTiNc6/HQ1jveY/RccGDXfh19KQVrdwcsh2
X-Google-Smtp-Source: APXvYqypfx2HThdGezp/oUedjYKv44Fb8n5lNK45oyS/vOtxc58Rwt4c9Y+yK17e0xs6J7fV+AYN9l/kG2KmENab
X-Received: by 2002:ab0:5c8:: with SMTP id e66mr54849002uae.10.1561386803022; 
 Mon, 24 Jun 2019 07:33:23 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:51 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <cf7bc20a86d45f690c211ebf284e9ecdaf6d4869.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 06/15] mm: untag user pointers in get_vaddr_frames
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
 bh=6wOlIN9RCqtC4EMjbsO9NIyMZhz6XW377zGYJAhhjSw=;
 b=EdyxEJFnWG9rQS7GXNgeJyNTxEu5LtqPTYYbN/QLe+5zlbDexboGyDqBC815Hrokjj
 qfAzqSeaTKPFvVv9WWYIndqnAPiRljjB3TIDjGP/0IMssQbdVP4BzrpsfzCXDKI9BDHt
 WeSswvJDxczfbCTt3IQqYPH1jX0VOQ5O+GZOEn825FLst0HqKs8RjnFS0DrDqqOlKlcm
 +N5mzxkUilj5uw0wDqYjDhK1/db8t8dLQzbwnNuEhal4y8tjJfxP9svgAu0LB4ORTyVD
 OZMU426HgS0vYo8hjqCwVk8ERda/jHZQ5JXLr2v38JKqFFajbtzb+/rl5BB+KXJN5rjD
 80IA==
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
dHMuCgpnZXRfdmFkZHJfZnJhbWVzIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1h
IGxvb2t1cHMsIHdoaWNoIGNhbgpvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4g
SW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdpbmcKYWxsIGNhbGxlcnMgb2YgdGhpcyBmdW5j
dGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCgpSZXZpZXdlZC1ieTogS2hhbGlkIEF6aXog
PGtoYWxpZC5heml6QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8
dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KQWNrZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0
YWxpbi5tYXJpbmFzQGFybS5jb20+ClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNo
cm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBn
b29nbGUuY29tPgotLS0KIG1tL2ZyYW1lX3ZlY3Rvci5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21tL2ZyYW1lX3ZlY3Rvci5jIGIvbW0vZnJh
bWVfdmVjdG9yLmMKaW5kZXggYzY0ZGNhNmUyN2MyLi5jNDMxY2E4MWRhZDUgMTAwNjQ0Ci0tLSBh
L21tL2ZyYW1lX3ZlY3Rvci5jCisrKyBiL21tL2ZyYW1lX3ZlY3Rvci5jCkBAIC00Niw2ICs0Niw4
IEBAIGludCBnZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGlu
dCBucl9mcmFtZXMsCiAJaWYgKFdBUk5fT05fT05DRShucl9mcmFtZXMgPiB2ZWMtPm5yX2FsbG9j
YXRlZCkpCiAJCW5yX2ZyYW1lcyA9IHZlYy0+bnJfYWxsb2NhdGVkOwogCisJc3RhcnQgPSB1bnRh
Z2dlZF9hZGRyKHN0YXJ0KTsKKwogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAlsb2NrZWQg
PSAxOwogCXZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlvbihtbSwgc3RhcnQsIHN0YXJ0ICsgMSk7
Ci0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
