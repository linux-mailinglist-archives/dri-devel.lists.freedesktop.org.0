Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC05246A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E48289FDB;
	Tue, 25 Jun 2019 07:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259CB89B69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:39 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id p64so6453252vkp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BJsyngqG/QyGrxCP5QV1VgvY/ZIDb46yXFdUWUYcJjE=;
 b=qUm3wlSqZRip9oM+fIU5E1kH/bKVbwz36wE/C0pNrhY2qU3T2FoSRmp2XfWUZ83Nno
 m2Taa+frsfxeQHm2YeEC+2rN6tKXSPzmpQGdEYx1APCyqZqQlIHikseJgTHiwQjWvFHI
 f9E/DLiBs/Do1L2Duu6FsTHhLQnvOnT4NbrVgXP+xCzDTakG1zlSRzAyKpvNf/oXl8ID
 IObomt769W6pSI8DdBM2UyZ3e+yXqi8cKQgD057Fhkfyees39fbkCc06QAr4deKeLlhv
 TTxDMLFSyG1Grz5gWyQIBdlLUtBXgyvQ9wurPV6EQ98SzhUOcX9YI9zACAOS1it6XzxV
 8rwQ==
X-Gm-Message-State: APjAAAWhDiUdwQyB8+mYq15XeDnRHSPAOhe6V9QvYuflgEB7av7NhouB
 R4buZcZSd7YJPPNmwBO1ZcMV4pB8hi6Oj3xk
X-Google-Smtp-Source: APXvYqxgB5X/aCbKs9hmuZWtlXYS7x7msb4DLFufqsMoO6mME7B8su644ppdcEygFH1GnaKdKATNFxnkdsXw3C2U
X-Received: by 2002:ab0:7782:: with SMTP id x2mr22851192uar.140.1561386818133; 
 Mon, 24 Jun 2019 07:33:38 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:55 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <61d800c35a4f391218fbca6f05ec458557d8d097.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 10/15] drm/radeon: untag user pointers in
 radeon_gem_userptr_ioctl
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
 bh=BJsyngqG/QyGrxCP5QV1VgvY/ZIDb46yXFdUWUYcJjE=;
 b=tMmuoJLkJJRlr97nWuw9yp1dhBnjJgJJVctCCMOkVQAwVufIWjtRSJ98DeVWMAUpL7
 c/DDMKTfXjJ3AunXbS9PbtesoR3v6FwAquf/mPo2ipW5m7uKq3mz622OTJgF//P41VeY
 uBPVky3FH88ifuyXm9IjyMmdhNWu2I8INL87p4oZ1vAogbY0BRq3PmSNaYTl1n/7bnrO
 Lc9PPi+EV8QQhe4FjeigOim3EKL5tCU2OhJP5k8d+H2v0cMsX/+SwQBn01vR1S+aYe8q
 kmK501SZalx1YaFY0Y1ChZDATvY9Cs1dirj078l2AUk0ox9yU2Ud6XA8n+4rc4SVim6s
 D61A==
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
IHBvaW50ZXJzIGluIHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bCgpLgoKU3VnZ2VzdGVkLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29u
b3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZ2VtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYwppbmRleCA0NDYxN2RlYzgxODMuLjkwZWI3OGZi
NWViMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKQEAgLTI5MSw2ICsyOTEsOCBA
QCBpbnQgcmFkZW9uX2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgKmRhdGEsCiAJdWludDMyX3QgaGFuZGxlOwogCWludCByOwogCisJYXJncy0+YWRkciA9IHVu
dGFnZ2VkX2FkZHIoYXJncy0+YWRkcik7CisKIAlpZiAob2Zmc2V0X2luX3BhZ2UoYXJncy0+YWRk
ciB8IGFyZ3MtPnNpemUpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4yMi4wLjQxMC5nZDhm
ZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
