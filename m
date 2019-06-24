Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA8524B1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70976E03A;
	Tue, 25 Jun 2019 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C4189B69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:36 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id y198so6468371vky.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=28kCgmnVQJn+BZTUIaDgZIVH/xo2y2bOHrwsQUj+YbM=;
 b=ITJXdIGGEnFSe03lNRmIc6mDp2G/73/7VjVJRVUxOFE1MuxcjTg/ZDpj0d0m+DZAk5
 rMGgyPTxLYXCVMb8o5AEOWIWJM3vmxpJxaFt6SpOrRCxSPXD3Bf0cP/uWHDGu618HOXF
 xWWQ8wIg+dT18l2MMIuFKWe9dv/bthTWeDCTWs2EnUGo4HinzvdKKuGf8x2TXcT5StNn
 Uq3psY8eVzxCT0d/5y1y4Z8hQ5Ijl8C87RWe108xcbWfUbAdW8nl/4rf6bmTRVh4U09D
 eEbvEMJQYeVH1OrO2eSPpLWqExiKugD2KaQdwHJ8ToqfgQT28/IY4/uTNb2g/DAUGEWw
 gp7w==
X-Gm-Message-State: APjAAAULjgZIf0OEJrq1dP7iqeWnD0l8C6emysUGQjcFuxXzpun0iWHG
 tE93BWUaDzGNRIDxS6IxOb8tiEEGP7mZY1BG
X-Google-Smtp-Source: APXvYqxFRRLv3BUPtPxjHGRaBJrhiwF+VRuSavZL/k035Tv2azTfOuV+FpSvTW5kRizXDXNW3SNuKikp21TfCtFX
X-Received: by 2002:a1f:9748:: with SMTP id z69mr4561739vkd.25.1561386814933; 
 Mon, 24 Jun 2019 07:33:34 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:54 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <1d036fc5bec4be059ee7f4f42bf7417dc44651dd.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 09/15] drm/amdgpu: untag user pointers
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
 bh=28kCgmnVQJn+BZTUIaDgZIVH/xo2y2bOHrwsQUj+YbM=;
 b=ABmMcgz7AotklEeh4aKRTIHhpGJQax1zmT5GPHXjwooqibRCX0X83G+wpDe15X0SRe
 HXe9A2NvGDpBCmPVnJWVtQfrGpLCbLOl8a7QKidgVQZS583p/fioInBWA7fnqQUcPu7U
 DvrTBHAjvD9bvEv4FtgsxMoYukH2FWhUY0cxk16hnaOXVOPeSCjP81uMpB44OL/S9lPI
 aBpKDHVXZkog9XLBmaqt8fwsR9QWzkmPDHX6Y9oJS6A6dF2fyXmif514CVj9w8GAfMxh
 0cWaNfDCDK5rhCagjFyHYvWusLBZwBz8roAGGf8iO/F/Oiq2iyr+j9wwDpgGJziFwszL
 TQvQ==
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
dHMuCgpJbiBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbmQgYW1kZ3B1X2FtZGtmZF9ncHV2
bS5jL2luaXRfdXNlcl9wYWdlcygpCmFuIE1NVSBub3RpZmllciBpcyBzZXQgdXAgd2l0aCBhICh0
YWdnZWQpIHVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdnZWQKYWRkcmVzcyBzaG91bGQgYmUg
dXNlZCBzbyB0aGF0IE1NVSBub3RpZmllcnMgZm9yIHRoZSB1bnRhZ2dlZCBhZGRyZXNzIGdldApj
b3JyZWN0bHkgbWF0Y2hlZCB1cCB3aXRoIHRoZSByaWdodCBCTy4gVGhpcyBwYXRjaCB1bnRhZyB1
c2VyIHBvaW50ZXJzIGluCmFtZGdwdV9nZW1fdXNlcnB0cl9pb2N0bCgpIGZvciB0aGUgR0VNIGNh
c2UgYW5kIGluIGFtZGdwdV9hbWRrZmRfZ3B1dm1fCmFsbG9jX21lbW9yeV9vZl9ncHUoKSBmb3Ig
dGhlIEtGRCBjYXNlLiBUaGlzIGFsc28gbWFrZXMgc3VyZSB0aGF0IGFuCnVudGFnZ2VkIHBvaW50
ZXIgaXMgcGFzc2VkIHRvIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoKSwgd2hpY2ggdXNl
cwppdCBmb3Igdm1hIGxvb2t1cHMuCgpTdWdnZXN0ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPgpBY2tlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxA
Z29vZ2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMg
ICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRf
Z3B1dm0uYwppbmRleCBhNmU1MTg0ZDQzNmMuLjVkNDc2ZTliYmM0MyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwpAQCAtMTEwOCw3ICsx
MTA4LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSgKIAkJ
YWxsb2NfZmxhZ3MgPSAwOwogCQlpZiAoIW9mZnNldCB8fCAhKm9mZnNldCkKIAkJCXJldHVybiAt
RUlOVkFMOwotCQl1c2VyX2FkZHIgPSAqb2Zmc2V0OworCQl1c2VyX2FkZHIgPSB1bnRhZ2dlZF9h
ZGRyKCpvZmZzZXQpOwogCX0gZWxzZSBpZiAoZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRE9PUkJF
TEwpIHsKIAkJZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOwogCQlhbGxvY19kb21haW4g
PSBBTURHUFVfR0VNX0RPTUFJTl9DUFU7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMKaW5kZXggZDRmY2Y1NDc1NDY0Li5lOTFkZjE0MDc2MTggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTI4Nyw2ICsyODcsOCBAQCBpbnQgYW1kZ3B1X2dl
bV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJdWlu
dDMyX3QgaGFuZGxlOwogCWludCByOwogCisJYXJncy0+YWRkciA9IHVudGFnZ2VkX2FkZHIoYXJn
cy0+YWRkcik7CisKIAlpZiAob2Zmc2V0X2luX3BhZ2UoYXJncy0+YWRkciB8IGFyZ3MtPnNpemUp
KQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
