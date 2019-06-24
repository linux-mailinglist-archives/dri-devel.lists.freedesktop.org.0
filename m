Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5352498
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170B989FCA;
	Tue, 25 Jun 2019 07:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B5689B69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:14 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id t196so16398629qke.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QQXMFisLcqxTDxCx7mpHBfkykflxcDxM95yy0y46L4c=;
 b=ccNrJTvIxsX5S7AvD4d1fOgc4DtvpcnIUZO+ZQjqQicrOWwwLLp36Sxjd/jQ8mgKxl
 25iNBC4ZyUY4KhPpji+Nraf1Q04SGF+Piq2OFB10uHGaC7PBxsgHddPrYcMgzbEkqQUZ
 +JJr9bKvzGLFOJVjARQnGmQO7HTXmE+qKsNgEIuwguKCklx2ZPhauCYoeoOBnqR+RWsN
 dcrtoNcRUVCvldK8+fY7lrr8s4KYkMQFyYEuv7M4PPbliJbLEBTgz+UEj363oCLY3iJq
 jqE3caqaDPIKkV4jKMzsP6EZ9i+pV0qC4JAwCJapHrLnAySdfcfazGn6LyuF/BzK2AMG
 iveg==
X-Gm-Message-State: APjAAAVYOzwHtkZNE9QngdopLNgePAvTakAbBdZtnwvYyBN0xC+dGr8J
 laLeS8/LR+v3q6cIgFWooTSjFlJWwPPaSa7K
X-Google-Smtp-Source: APXvYqzup51zNJearylpYQzBo2BoCcuJ3XXHspU9PtHQODnUVY/RZyP6CGJqukGO0YgO4GkOlCbGA2J//cHunZZU
X-Received: by 2002:a37:a2cc:: with SMTP id
 l195mr16730110qke.362.1561386793770; 
 Mon, 24 Jun 2019 07:33:13 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:48 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <1a53da43d69d644793110e85671d20158ebf29cb.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 03/15] lib: untag user pointers in strn*_user
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
 bh=QQXMFisLcqxTDxCx7mpHBfkykflxcDxM95yy0y46L4c=;
 b=nl7WANT+T3zzJdQNSfB9+m3b8ydqMfXiozgRLYeQCHFc4zWOn1Q8HlSZi7DGmunKcG
 m48YCubQKuyc5mIC9PWmc95WNcaYrn+rBkilmeEtWye/vcm/w7SgqxmZ+eLuRWNk+dBe
 ilcc0xwMAFdqkWVOavUtr03O5uEwSiv8ah8EA2ZNm/JYdo0vp1VaJuLVzssnLAaxlz0W
 +bGemSNE16fXrFDUhV0Eo7CJiC+zuIHkEvL14QgEfP6YhZ1zpRezDVdue+M4lC6Urd5x
 s/pZSUm/6UDNd/YlF2uYqWPTYuto+748pEjr815zYdNJlDljrtH9f8RpmzII6hCRLyFl
 B0aA==
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
dHMuCgpzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2VyIGFkZHJl
c3NlcyBhcyBhcmd1bWVudHMsIGFuZApkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBwYXRoIGFz
IGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKbmVlZCB0byBoYW5kbGUgdGhl
IGNhc2Ugb2YgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHNlcGFyYXRlbHkuCgpVbnRhZyB1c2VyIHBv
aW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCgpOb3RlLCB0aGF0IHRoaXMgcGF0Y2gg
b25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0KdmFsaWRpdHkg
Y2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1lbW9yeSBh
Y2Nlc3Nlcy4KClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8dmluY2Vuem8uZnJhc2Np
bm9AYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBvcmFjbGUu
Y29tPgpBY2tlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+ClJldmlld2Vk
LWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogbGliL3N0
cm5jcHlfZnJvbV91c2VyLmMgfCAzICsrLQogbGliL3N0cm5sZW5fdXNlci5jICAgICAgfCAzICsr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMgYi9saWIvc3RybmNweV9mcm9tX3VzZXIu
YwppbmRleCAwMjNiYTlmM2I5OWYuLmRjY2I5NWFmNjAwMyAxMDA2NDQKLS0tIGEvbGliL3N0cm5j
cHlfZnJvbV91c2VyLmMKKysrIGIvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMKQEAgLTYsNiArNiw3
IEBACiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
PgogI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CisjaW5jbHVkZSA8bGludXgvbW0uaD4KIAogI2lu
Y2x1ZGUgPGFzbS9ieXRlb3JkZXIuaD4KICNpbmNsdWRlIDxhc20vd29yZC1hdC1hLXRpbWUuaD4K
QEAgLTEwOCw3ICsxMDksNyBAQCBsb25nIHN0cm5jcHlfZnJvbV91c2VyKGNoYXIgKmRzdCwgY29u
c3QgY2hhciBfX3VzZXIgKnNyYywgbG9uZyBjb3VudCkKIAkJcmV0dXJuIDA7CiAKIAltYXhfYWRk
ciA9IHVzZXJfYWRkcl9tYXgoKTsKLQlzcmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXNyYzsKKwlz
cmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXVudGFnZ2VkX2FkZHIoc3JjKTsKIAlpZiAobGlrZWx5
KHNyY19hZGRyIDwgbWF4X2FkZHIpKSB7CiAJCXVuc2lnbmVkIGxvbmcgbWF4ID0gbWF4X2FkZHIg
LSBzcmNfYWRkcjsKIAkJbG9uZyByZXR2YWw7CmRpZmYgLS1naXQgYS9saWIvc3Rybmxlbl91c2Vy
LmMgYi9saWIvc3Rybmxlbl91c2VyLmMKaW5kZXggN2YyZGIzZmUzMTFmLi4yOGZmNTU0YTFiZTgg
MTAwNjQ0Ci0tLSBhL2xpYi9zdHJubGVuX3VzZXIuYworKysgYi9saWIvc3Rybmxlbl91c2VyLmMK
QEAgLTIsNiArMiw3IEBACiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZXhwb3J0Lmg+CiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgorI2luY2x1ZGUgPGxpbnV4
L21tLmg+CiAKICNpbmNsdWRlIDxhc20vd29yZC1hdC1hLXRpbWUuaD4KIApAQCAtMTA5LDcgKzEx
MCw3IEBAIGxvbmcgc3Rybmxlbl91c2VyKGNvbnN0IGNoYXIgX191c2VyICpzdHIsIGxvbmcgY291
bnQpCiAJCXJldHVybiAwOwogCiAJbWF4X2FkZHIgPSB1c2VyX2FkZHJfbWF4KCk7Ci0Jc3JjX2Fk
ZHIgPSAodW5zaWduZWQgbG9uZylzdHI7CisJc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZyl1bnRh
Z2dlZF9hZGRyKHN0cik7CiAJaWYgKGxpa2VseShzcmNfYWRkciA8IG1heF9hZGRyKSkgewogCQl1
bnNpZ25lZCBsb25nIG1heCA9IG1heF9hZGRyIC0gc3JjX2FkZHI7CiAJCWxvbmcgcmV0dmFsOwot
LSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
