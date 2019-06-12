Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8654339F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C743289590;
	Thu, 13 Jun 2019 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D1C8930F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:43:53 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id u129so13474707qkd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lneYlz8LHaEiU1JdbWuWSlmR06MpCpkboyQbci6TbSY=;
 b=AAFK5RxBJxNJb7M0Z9Hlwi1KRGYJyDtbKGUYv9wmi4Mn52KoRhdRTAyqa1OafGRWQz
 VOZnsLjbW55/xA20NFomgIhK8Fy0o7k6KtccczYUIT1iYH16fnFvY5jrCMWEjuH45P5L
 vNBEuvCAElpaUrStZwU4pxdGsxOx+GYgcyY3ZU/pJfXAdDv8jhf8W2zPu46FOJ8TCBSh
 EUlPnr2X2bYSjSWrvEwPOyoIjWQVTXrBxrOuqqbiOPUNyiWhHc6PFxqLQstXQ3G9o1dI
 GLQ+U31wnETsiaUHvlLp4YFnyY2Sgke01y/ZDk4XstGEqTXHrmsBOMcPbxJQesIDoE2n
 0OSw==
X-Gm-Message-State: APjAAAUD9/RFYRpPkhKN9wqM4L01LKXJapOaQSuYZfkC7XUzS1FKErGP
 myReGHvQRoBQE0BJk7r57Y2y5HdEFtvWMAmo
X-Google-Smtp-Source: APXvYqycBZ/jgN95w1hvszVcRcdW7P9Dg7ub2DyBfBHGpLBHXa9MwJ+9kmDh7H9YZkcwArOGpwiZYJEXckCXcJ6D
X-Received: by 2002:a37:a5d5:: with SMTP id
 o204mr25506301qke.155.1560339832693; 
 Wed, 12 Jun 2019 04:43:52 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:22 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <8f65548bef8544d49980a92d221b74440d544c1e.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 05/15] mm, arm64: untag user pointers in mm/gup.c
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
 bh=lneYlz8LHaEiU1JdbWuWSlmR06MpCpkboyQbci6TbSY=;
 b=ZYQEd649LLsr0eo67tg5mBkc6yqoxRRkUvXmz72kCnd/9DceAYIH632RHTy/L9FYgN
 XB0cqiUT3202g16B44AOr6KGjUuUQCuOjjfhX/1rdyfTYvOLIoAOYVJQEyUECaYKw2EI
 wRT/I+bn5+fj2NWK1Uq2bsCtdk4XPg+CFAKbAVJ1PN2JQI+rUil/RmfEGI1P+fH7HVvB
 bi61I1IZdPLHbF9O0x6GFnVgN1H+PpiOuX7A6ltMyEW2b4fJxpc44OPAWrBW3bGwUHZL
 UOaZyEvgJIbhkL4J+WjiYsF7XS5CEf84amjDEh8dkaorHVY5qClgPk6YQHyQ5aqjEpT+
 PVjA==
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
cmd1bWVudHMuCgptbS9ndXAuYyBwcm92aWRlcyBhIGtlcm5lbCBpbnRlcmZhY2UgdGhhdCBhY2Nl
cHRzIHVzZXIgYWRkcmVzc2VzIGFuZAptYW5pcHVsYXRlcyB1c2VyIHBhZ2VzIGRpcmVjdGx5IChm
b3IgZXhhbXBsZSBnZXRfdXNlcl9wYWdlcywgdGhhdCBpcyB1c2VkCmJ5IHRoZSBmdXRleCBzeXNj
YWxsKS4gU2luY2UgYSB1c2VyIGNhbiBwcm92aWRlZCB0YWdnZWQgYWRkcmVzc2VzLCB3ZSBuZWVk
CnRvIGhhbmRsZSB0aGlzIGNhc2UuCgpBZGQgdW50YWdnaW5nIHRvIGd1cC5jIGZ1bmN0aW9ucyB0
aGF0IHVzZSB1c2VyIGFkZHJlc3NlcyBmb3Igdm1hIGxvb2t1cHMuCgpSZXZpZXdlZC1ieTogS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmlu
YXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3Zh
bG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogbW0vZ3VwLmMgfCA0ICsrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1
cC5jCmluZGV4IGRkZGUwOTdjZjllNC4uYzM3ZGYzZDQ1NWEyIDEwMDY0NAotLS0gYS9tbS9ndXAu
YworKysgYi9tbS9ndXAuYwpAQCAtODAyLDYgKzgwMiw4IEBAIHN0YXRpYyBsb25nIF9fZ2V0X3Vz
ZXJfcGFnZXMoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAog
CWlmICghbnJfcGFnZXMpCiAJCXJldHVybiAwOwogCisJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0
YXJ0KTsKKwogCVZNX0JVR19PTighIXBhZ2VzICE9ICEhKGd1cF9mbGFncyAmIEZPTExfR0VUKSk7
CiAKIAkvKgpAQCAtOTY0LDYgKzk2Niw4IEBAIGludCBmaXh1cF91c2VyX2ZhdWx0KHN0cnVjdCB0
YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYTsKIAl2bV9mYXVsdF90IHJldCwgbWFqb3IgPSAwOwogCisJYWRkcmVzcyA9IHVu
dGFnZ2VkX2FkZHIoYWRkcmVzcyk7CisKIAlpZiAodW5sb2NrZWQpCiAJCWZhdWx0X2ZsYWdzIHw9
IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlk7CiAKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMy
LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
