Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFA105C2
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A7C89338;
	Wed,  1 May 2019 07:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A191F88CBF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:27 +0000 (UTC)
Received: by mail-ua1-x949.google.com with SMTP id j7so1928738uaj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BvUTfQkQM7uCDeEtImKKI/2Hme2ZprNLcMmbkGV4djo=;
 b=exLOacOdafF2GI4NGuaybhEYTVojx/QtpcwGmRHoFc4hyiiDAx1+z+mvEVcbRe3Imi
 emPmnuH5V8xOOtZx88VEj4VQQT1NnWtUT9OnJxFCpfEzvydBOVepfq7HfKhSEoPRVBsA
 ZOO80GEY1G3qzFnfphtI4nVm2XQkfk2xouALFeajUEq9zRIiyWvUq4b0XOOjawlOLTFE
 cC3aE6/7Ya2klt468xjGnYepswYmSqHFVo8KtFd6xuVMVnnZWnjB0PYSVrOH7frgtPoz
 bcgrWQKeOwfoUDKd0iNm7S7gNxQBdtRgwza78WNLfyEmErQMa5EkIGN0dHnl8C+CK+FQ
 ACUg==
X-Gm-Message-State: APjAAAUMZQ3Jl34HkMLX2WFO5Vu3OLwl/yQeVQXDZXh87EAuzledJXaF
 ddsNgD+pJpy0unOsGZSLKi6ZzbzvdRNwHJsu
X-Google-Smtp-Source: APXvYqyRA/Qu4LKAWcvJoaQQlsyyIllouYjqkXgAFh5vrZ+95OMG6R4QdBb3NSzDXJSn7wdUrbj4M88LAp+D5Hqp
X-Received: by 2002:a67:ea83:: with SMTP id f3mr2107513vso.59.1556630726654;
 Tue, 30 Apr 2019 06:25:26 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:24:59 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <6f38f610cc22dca9aef05d53a5a94b24763cc628.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 03/17] lib, arm64: untag user pointers in strn*_user
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
 bh=BvUTfQkQM7uCDeEtImKKI/2Hme2ZprNLcMmbkGV4djo=;
 b=dpVTwFKbchbVkkb84ng8BnoHNS2SM91wquNJtuly6Sbp7lXj1bPrbJBiP3SyhTU0xP
 LuA/DNrbjhKI/dHi3IXFK1lS8O09Sk1+qA/R7rjDLupO2W7Szy3T1dELXK4hEpZqkwPw
 qD0yKLxb8ZjzpYALNjI1z0dDf4TB8V0IRIOptCx1gDVu9+jOblt+XzKkwvlPuV63pqHj
 wnFsYt5mNXo/Rj6N9Lo9JMQODsljOWPF/MJrAcRLfdznXkGZCgNmaSrk7MrXtOUREZGb
 X2QTJ1/W011vEIe5OofpK81AMWPuQy4lXPQltspauNse0OruElYuf2mJ90h6FolZJ8lL
 VpnA==
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
cmd1bWVudHMuCgpzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2Vy
IGFkZHJlc3NlcyBhcyBhcmd1bWVudHMsIGFuZApkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBw
YXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKbmVlZCB0byBoYW5k
bGUgdGhlIGNhc2Ugb2YgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHNlcGFyYXRlbHkuCgpVbnRhZyB1
c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCgpOb3RlLCB0aGF0IHRoaXMg
cGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0KdmFs
aWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1l
bW9yeSBhY2Nlc3Nlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtu
dmxAZ29vZ2xlLmNvbT4KLS0tCiBsaWIvc3RybmNweV9mcm9tX3VzZXIuYyB8IDMgKystCiBsaWIv
c3Rybmxlbl91c2VyLmMgICAgICB8IDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvc3RybmNweV9mcm9tX3VzZXIu
YyBiL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jCmluZGV4IDU4ZWFjZDQxNTI2Yy4uNjIwOWJiOTUw
N2M3IDEwMDY0NAotLS0gYS9saWIvc3RybmNweV9mcm9tX3VzZXIuYworKysgYi9saWIvc3RybmNw
eV9mcm9tX3VzZXIuYwpAQCAtNiw2ICs2LDcgQEAKICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+
CiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KKyNp
bmNsdWRlIDxsaW51eC9tbS5oPgogCiAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgogI2luY2x1
ZGUgPGFzbS93b3JkLWF0LWEtdGltZS5oPgpAQCAtMTA3LDcgKzEwOCw3IEBAIGxvbmcgc3RybmNw
eV9mcm9tX3VzZXIoY2hhciAqZHN0LCBjb25zdCBjaGFyIF9fdXNlciAqc3JjLCBsb25nIGNvdW50
KQogCQlyZXR1cm4gMDsKIAogCW1heF9hZGRyID0gdXNlcl9hZGRyX21heCgpOwotCXNyY19hZGRy
ID0gKHVuc2lnbmVkIGxvbmcpc3JjOworCXNyY19hZGRyID0gKHVuc2lnbmVkIGxvbmcpdW50YWdn
ZWRfYWRkcihzcmMpOwogCWlmIChsaWtlbHkoc3JjX2FkZHIgPCBtYXhfYWRkcikpIHsKIAkJdW5z
aWduZWQgbG9uZyBtYXggPSBtYXhfYWRkciAtIHNyY19hZGRyOwogCQlsb25nIHJldHZhbDsKZGlm
ZiAtLWdpdCBhL2xpYi9zdHJubGVuX3VzZXIuYyBiL2xpYi9zdHJubGVuX3VzZXIuYwppbmRleCAx
YzFhMWIwZTM4YTUuLjhjYTNkMmFjMzJlYyAxMDA2NDQKLS0tIGEvbGliL3N0cm5sZW5fdXNlci5j
CisrKyBiL2xpYi9zdHJubGVuX3VzZXIuYwpAQCAtMiw2ICsyLDcgQEAKICNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KICNpbmNsdWRlIDxsaW51eC91
YWNjZXNzLmg+CisjaW5jbHVkZSA8bGludXgvbW0uaD4KIAogI2luY2x1ZGUgPGFzbS93b3JkLWF0
LWEtdGltZS5oPgogCkBAIC0xMDksNyArMTEwLDcgQEAgbG9uZyBzdHJubGVuX3VzZXIoY29uc3Qg
Y2hhciBfX3VzZXIgKnN0ciwgbG9uZyBjb3VudCkKIAkJcmV0dXJuIDA7CiAKIAltYXhfYWRkciA9
IHVzZXJfYWRkcl9tYXgoKTsKLQlzcmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXN0cjsKKwlzcmNf
YWRkciA9ICh1bnNpZ25lZCBsb25nKXVudGFnZ2VkX2FkZHIoc3RyKTsKIAlpZiAobGlrZWx5KHNy
Y19hZGRyIDwgbWF4X2FkZHIpKSB7CiAJCXVuc2lnbmVkIGxvbmcgbWF4ID0gbWF4X2FkZHIgLSBz
cmNfYWRkcjsKIAkJbG9uZyByZXR2YWw7Ci0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOC1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
