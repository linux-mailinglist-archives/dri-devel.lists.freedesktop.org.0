Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB615E23
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BC989DE5;
	Tue,  7 May 2019 07:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EF089A5E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:32:00 +0000 (UTC)
Received: by mail-ua1-x949.google.com with SMTP id v25so256083uaa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SWVsw2knEHBiqwTje+QZ95uhvJ0Eq8KQC+Uh3mHLIrs=;
 b=oORx4gFOJxGuQbBtr6V06rkrQpwAAuGKBbnF5v9VmF9HW8AAIRURy/7dv4lDRpiMPT
 KQPecDm47LEJhWBNLwdNdqGdWycXjUGaGxtKURf/NPAnTM5qh3NeWOIU74UREiFbFyWU
 Fi9Q3+KwF2tU9WKzWC2ldgd1PmjTNplTSF4aJ7hBvYvH/LBIuXhlQs6diOXdsPm5TD55
 9CM49MDtsiH0+Hfk1llNPy9sDfdhDBoMMbri0zpBuPXJs6YxAMe0AEDrLTcKxumZknWN
 zunL1zqa1RZJBRA+P8OrOVzYXMTEtkgIjzvLt3Z1uUx7Y3DlMAAGztdbepMgUZ55qBsP
 w8Zw==
X-Gm-Message-State: APjAAAWF99g6K5JUXKWrJSZGbabSW8d4/gFTMoiIONz5+j0p+Kbehd+x
 3GkjErQMV21NdApTjp6ZyFH/MhkycnxsWFUk
X-Google-Smtp-Source: APXvYqzqHfit8S9j9GkAK338RCzBXfh/l/pOO+ozkZWr4c4UHEKzTSoAg+io9ZiclURMXMIijYhqt5pgUoOVGv8c
X-Received: by 2002:a67:f6c4:: with SMTP id v4mr13696595vso.182.1557160319808; 
 Mon, 06 May 2019 09:31:59 -0700 (PDT)
Date: Mon,  6 May 2019 18:31:03 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 17/17] selftests, arm64: add a selftest for passing tagged
 pointers to kernel
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
 bh=SWVsw2knEHBiqwTje+QZ95uhvJ0Eq8KQC+Uh3mHLIrs=;
 b=RgL6sD0qMVVBo2W6IqHUBM5jj9VtirOB0KEMhgfz8sMUxbZ1FQX2voyY3kT1G83YUB
 c2NHug1MaUbvaiT2/kwsYJcX1LID/13F0wNOf2AHICLEHy5XvFyjYislt0SYk+XJ6yKP
 649zRPJ+NdSdXSoussFiI5QFPPYrqQUh3ojhtBNMt1d4e4tKjAnQkQjx5Eh1zuXQvQIM
 JcTGFQAzGxQj9nG+dHgIo2BfMYCnSXgaj1ghPhO7L6oN78p0fysyobcM96NyuviAQaqi
 YZLFqu1hahvJ559CgByQZZLzdRPUlocjvpj3Ingemtoy/aM5Di1UnW6jML/TVEYZ07jc
 pviA==
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
cmd1bWVudHMuCgpUaGlzIHBhdGNoIGFkZHMgYSBzaW1wbGUgdGVzdCwgdGhhdCBjYWxscyB0aGUg
dW5hbWUgc3lzY2FsbCB3aXRoIGEKdGFnZ2VkIHVzZXIgcG9pbnRlciBhcyBhbiBhcmd1bWVudC4g
V2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKdXNlciBwb2ludGVycyB0aGUgdGVz
dCBmYWlscyB3aXRoIEVGQVVMVC4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFu
ZHJleWtudmxAZ29vZ2xlLmNvbT4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8u
Z2l0aWdub3JlICAgICAgfCAgMSArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtl
ZmlsZSAgICAgICAgfCAxMSArKysrKysrKysrCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQv
cnVuX3RhZ3NfdGVzdC5zaCAgfCAxMiArKysrKysrKysrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYXJtNjQvdGFnc190ZXN0LmMgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKwogNCBmaWxl
cyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGlnbm9yZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA3NTUgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaAogY3JlYXRlIG1vZGUg
MTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGlnbm9yZSBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2FybTY0Ly5naXRpZ25vcmUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi5lOGZhZThkNjFlZDYKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlCkBAIC0wLDAgKzEgQEAKK3RhZ3NfdGVz
dApkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAuLmE2MWIyZTc0M2U5OQotLS0gL2Rldi9udWxsCisrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlCkBAIC0wLDAgKzEsMTEgQEAKKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKworIyBBUkNIIGNhbiBiZSBvdmVycmlk
ZGVuIGJ5IHRoZSB1c2VyIGZvciBjcm9zcyBjb21waWxpbmcKK0FSQ0ggPz0gJChzaGVsbCB1bmFt
ZSAtbSAyPi9kZXYvbnVsbCB8fCBlY2hvIG5vdCkKKworaWZuZXEgKCwkKGZpbHRlciAkKEFSQ0gp
LGFhcmNoNjQgYXJtNjQpKQorVEVTVF9HRU5fUFJPR1MgOj0gdGFnc190ZXN0CitURVNUX1BST0dT
IDo9IHJ1bl90YWdzX3Rlc3Quc2gKK2VuZGlmCisKK2luY2x1ZGUgLi4vbGliLm1rCmRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaApuZXcgZmlsZSBtb2Rl
IDEwMDc1NQppbmRleCAwMDAwMDAwMDAwMDAuLjc0NWYxMTM3OTkzMAotLS0gL2Rldi9udWxsCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3J1bl90YWdzX3Rlc3Quc2gKQEAgLTAs
MCArMSwxMiBAQAorIyEvYmluL3NoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
CisKK2VjaG8gIi0tLS0tLS0tLS0tLS0tLS0tLS0tIgorZWNobyAicnVubmluZyB0YWdzIHRlc3Qi
CitlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tLSIKKy4vdGFnc190ZXN0CitpZiBbICQ/IC1uZSAw
IF07IHRoZW4KKwllY2hvICJbRkFJTF0iCitlbHNlCisJZWNobyAiW1BBU1NdIgorZmkKZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi4yYmQxODMwYTdlYmUKLS0tIC9kZXYvbnVsbAorKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3QuYwpAQCAtMCwwICsxLDIxIEBACisv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCisjaW5jbHVkZSA8c3RkaW8uaD4K
KyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxzdGRp
bnQuaD4KKyNpbmNsdWRlIDxzeXMvdXRzbmFtZS5oPgorCisjZGVmaW5lIFNISUZUX1RBRyh0YWcp
CQkoKHVpbnQ2NF90KSh0YWcpIDw8IDU2KQorI2RlZmluZSBTRVRfVEFHKHB0ciwgdGFnKQkoKCh1
aW50NjRfdCkocHRyKSAmIH5TSElGVF9UQUcoMHhmZikpIHwgXAorCQkJCQlTSElGVF9UQUcodGFn
KSkKKworaW50IG1haW4odm9pZCkKK3sKKwlzdHJ1Y3QgdXRzbmFtZSAqcHRyID0gKHN0cnVjdCB1
dHNuYW1lICopbWFsbG9jKHNpemVvZigqcHRyKSk7CisJdm9pZCAqdGFnZ2VkX3B0ciA9ICh2b2lk
ICopU0VUX1RBRyhwdHIsIDB4NDIpOworCWludCBlcnIgPSB1bmFtZSh0YWdnZWRfcHRyKTsKKwor
CWZyZWUocHRyKTsKKwlyZXR1cm4gZXJyOworfQotLSAKMi4yMS4wLjEwMjAuZ2YyODIwY2YwMWEt
Z29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
