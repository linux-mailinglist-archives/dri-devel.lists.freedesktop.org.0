Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FE43388
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE260892F2;
	Thu, 13 Jun 2019 07:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041528932D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:06 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id r142so15282850ybc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=49lyybNUomf5TPPaYx2MdHbLNYXxhntLqw2Vq4fwp4Q=;
 b=VRJhnZ4gpc4tTJ+Q3FdLkOT/SBzkZm3AKiNLnTnrlq65k2ZEAQZHcQld5wnMzr85xE
 2E/HvNBsgcsTIRFyGWckpwPW4EgqYY3cec3PT89f3Z7dmTQpklXsafWq1/uOjkvPnuDI
 WeWe2/WsJQRppqkVB+wbA+5agWhU/yiM9F+j+QBNiWpMMabxoSyBa5wDR3JBxJCaE+gh
 9QQR/qaafbv72WI77OjJgr2lGf0dGTC9l3m4IUzRkfnJNRsvbLsLATGuOBGVSOUMZmoL
 aNTXPyc/gw4sTo9PmaVrAQcjRQYX2QLeensP/EewBRfZTrJcLjp8tnHI7u+SP0VK/TqB
 EkqA==
X-Gm-Message-State: APjAAAWBKYCJF7WZUf8ZBCa0zJsL6jy0+mgqPH9otiaQKGiJuJ5o+vLq
 hj8f1p1teyP0nDBnUYe4uj50yY7zXOKUoPZT
X-Google-Smtp-Source: APXvYqxF+/T3yPkem3l6CI+bv3/rmqxcJMbV/vABJbuoyeQcWj2Unps+PKPx2+cODkSgswAOZakXvU9OwOpzOWtl
X-Received: by 2002:a81:2717:: with SMTP id n23mr31165867ywn.423.1560339845094; 
 Wed, 12 Jun 2019 04:44:05 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:26 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <d9cbdcc3c4926bf70fe0014110901a0755e8e869.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 09/15] drm/amdgpu, arm64: untag user pointers
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
 bh=49lyybNUomf5TPPaYx2MdHbLNYXxhntLqw2Vq4fwp4Q=;
 b=ihFwqktAIqrJiTQwTjUhK+MAdfOsiouWKHqO7ZjSSZRmzOCHa96d8VJOaNVIZNxAcO
 AN6aXPp/RE1MrQ6zM8JJXD7nVRwFFfp5nOw9hthmPYYo49089cBtVFaOKAL5CUs7PfyJ
 QVJHzuksJxoSuikR4fgviWI+uxOP0qQaG3AiODD2sa8fpyWPMeWsTelFk8q9IMn10OKD
 +UNh5Ci6TXkOO1z7q/a2BisVOKAv5AoSV7//DSqtdeKoVvYLLBYkbZ3uB0cH3pp+Kewb
 rQGpoPMvtpdogBshUOOc5uWdI95iNZkAb+XnamPk3rh+8KJ/cKljnQO2b6iriftiFlMR
 wRJQ==
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
cmd1bWVudHMuCgpJbiBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbmQgYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jL2luaXRfdXNlcl9wYWdlcygpCmFuIE1NVSBub3RpZmllciBpcyBzZXQgdXAgd2l0
aCBhICh0YWdnZWQpIHVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdnZWQKYWRkcmVzcyBzaG91
bGQgYmUgdXNlZCBzbyB0aGF0IE1NVSBub3RpZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNz
IGdldApjb3JyZWN0bHkgbWF0Y2hlZCB1cCB3aXRoIHRoZSByaWdodCBCTy4gVGhpcyBwYXRjaCB1
bnRhZyB1c2VyIHBvaW50ZXJzIGluCmFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgpIGZvciB0aGUg
R0VNIGNhc2UgYW5kIGluIGFtZGdwdV9hbWRrZmRfZ3B1dm1fCmFsbG9jX21lbW9yeV9vZl9ncHUo
KSBmb3IgdGhlIEtGRCBjYXNlLiBUaGlzIGFsc28gbWFrZXMgc3VyZSB0aGF0IGFuCnVudGFnZ2Vk
IHBvaW50ZXIgaXMgcGFzc2VkIHRvIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoKSwgd2hp
Y2ggdXNlcwppdCBmb3Igdm1hIGxvb2t1cHMuCgpTdWdnZXN0ZWQtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpBY2tlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJl
eWtudmxAZ29vZ2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dwdXZtLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYwppbmRleCBhNmU1MTg0ZDQzNmMuLjVkNDc2ZTliYmM0MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwpAQCAtMTEw
OCw3ICsxMTA4LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dw
dSgKIAkJYWxsb2NfZmxhZ3MgPSAwOwogCQlpZiAoIW9mZnNldCB8fCAhKm9mZnNldCkKIAkJCXJl
dHVybiAtRUlOVkFMOwotCQl1c2VyX2FkZHIgPSAqb2Zmc2V0OworCQl1c2VyX2FkZHIgPSB1bnRh
Z2dlZF9hZGRyKCpvZmZzZXQpOwogCX0gZWxzZSBpZiAoZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1Nf
RE9PUkJFTEwpIHsKIAkJZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOwogCQlhbGxvY19k
b21haW4gPSBBTURHUFVfR0VNX0RPTUFJTl9DUFU7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2VtLmMKaW5kZXggZDRmY2Y1NDc1NDY0Li5lOTFkZjE0MDc2MTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTI4Nyw2ICsyODcsOCBAQCBpbnQgYW1k
Z3B1X2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
CiAJdWludDMyX3QgaGFuZGxlOwogCWludCByOwogCisJYXJncy0+YWRkciA9IHVudGFnZ2VkX2Fk
ZHIoYXJncy0+YWRkcik7CisKIAlpZiAob2Zmc2V0X2luX3BhZ2UoYXJncy0+YWRkciB8IGFyZ3Mt
PnNpemUpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4yMi4wLnJjMi4zODMuZ2Y0ZmJiZjMw
YzItZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
