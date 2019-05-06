Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DA15E0A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ED489DB4;
	Tue,  7 May 2019 07:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF4889A59
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:31:17 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id r23so9675392ywg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=x8HMVSO2lCP9thpVq0jteC8wa+ruR/qG5sfvMEzcSf4=;
 b=iRwqaSFoeluYe+2z7NA6VVwZ9sNwMLoh/IrwIs4SwzO3PyoQf2ny8N03cKMj3x1GIC
 tvz4ASC1DNZvY8ZkV5UIGqHiv8INUXc4BjeP1RFFIj6BUrOj9VzCcvIYSzO4iYIVyqzy
 sWE1CSY5kqlSEqRAUwlubNv+VwSOHcUyNpFMXQzCfqpG08Mbr1jdWEMOKgC3oKaPxs65
 qHFrNrD5NCo90jh37bWt5066lqle1WVHetzmDrFRFKLK3A3qoi5g+mVby24hYlWGv7Sd
 8mhTwFcr9gEwTStghyeSGFnNZKdchlptKYl39v9zldNiKB4/EXMSwczTlYJ84BlpSDm9
 Oedg==
X-Gm-Message-State: APjAAAX/5YYKnzphO7+7aJ5/Kdhe2giQl9q7KCi2ztylFkd+1MwM8aB7
 b92TrgIPGZlLc8mRot6pxo/+UA0655w+6T7q
X-Google-Smtp-Source: APXvYqyZq8rlWFW4uBLN8C8I3oEaQAU5CNW3HReq+6c5opQ9wp/VGDDqgMMeEo6tOAWNlA3+Gfl3rFVlDcMv6bDq
X-Received: by 2002:a5b:8c2:: with SMTP id w2mr16278460ybq.201.1557160276487; 
 Mon, 06 May 2019 09:31:16 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:49 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <861418ff7ed7253356cb8267de5ee2d4bd84196d.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 03/17] lib, arm64: untag user pointers in strn*_user
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=x8HMVSO2lCP9thpVq0jteC8wa+ruR/qG5sfvMEzcSf4=;
 b=e90YIYJEqCjuv0dQNXe7JfByZ3LYw/uoix1gLG6qHxakrZEGoit4yh6fTDsfYia+jH
 wb7igUzrFQvpjJl955zqS3eb64AMNM806CURkcixGS6z1rzCJzMGBiAz82rRhlhjgKjR
 9cdDyeo/3JMugM0eGAxc56H2X/rF/Gu5NZJ6OlTvycYfBxRjWeovYDz5GGyc2/popU6X
 Q4rJTvbhNlqr5zqGtmKCjWUttV6dsKWcbk2qBw0aV1In8VLH8mRF5MiPk8iCO4KWMnPF
 BSI3N1BBXtSHWlnz3+Iji+1TK5JldUspg0pnnlvUCK4PaDa6c2GsK9cElOVCY5yx3kNx
 bcTw==
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
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
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
cmNfYWRkcjsKIAkJbG9uZyByZXR2YWw7Ci0tIAoyLjIxLjAuMTAyMC5nZjI4MjBjZjAxYS1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
