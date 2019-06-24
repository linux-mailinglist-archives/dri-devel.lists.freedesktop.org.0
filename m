Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC975245C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBD789F4F;
	Tue, 25 Jun 2019 07:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9492889B69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:51 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id f125so6439336vkc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/YALAWfXM1Ec4B1lOAT/D+NA+cyFiVncn64tZ/r98OM=;
 b=KTvbHjJhSr2XxUxlWuiKb8HSTB06y9y+4+XFc5EgpLL5/GV7OcF/f+G3N/OBkUPZ0c
 2pxVyAnvtW7e844Fg0TXw3KEZs8W2PmdouWCeJlwxMfmfxMMoUjw+AoiVVblc2shtL6T
 jM715XX6a+kuYDwBOwda3GzTcIdEGdEnJyE3Zs7mhcHYeF1o+vSdfxj3k0TFrd7oSqAW
 B7bqM53pGzLY3Gj7iu3TLS0tMzd2Hb3+pPvExojdVrn6Y14Hldo1dRUc/bnTvWPvf3CH
 l/oGg0KZ1ytY+LgNV1tteXGGDGhL03EY8KyzOEIlYr/rFzYzDdvNal+w4cd9vxcoHbck
 ZtmA==
X-Gm-Message-State: APjAAAU7DmYYM0PSb/NG5JmDr5EcN+NT0fPsCDfPSROH972o71E2PVv0
 T3s55XcbkBl8hRFqqZWHMLNSy7po4ZBFhNVj
X-Google-Smtp-Source: APXvYqzcPL+MfuI0G9Nd/HSZW5720Hxob5Qe3sb32I8/yavc0Ub0kNUbvXmDnUxRuwL2tRyo+O0TaelZxw+BF2mv
X-Received: by 2002:a1f:7dc2:: with SMTP id y185mr1688822vkc.51.1561386830607; 
 Mon, 24 Jun 2019 07:33:50 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:59 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <125994bfab8f29da8f58c8fcd0d94ef4bf55b3ea.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 14/15] vfio/type1: untag user pointers in vaddr_get_pfn
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
 bh=/YALAWfXM1Ec4B1lOAT/D+NA+cyFiVncn64tZ/r98OM=;
 b=Ql48XStLri/shxEZnh2m2bPKZuWW0LbLVZb7Ke39XzoW6tnlHJqvY/w3tAOiQXd+HY
 +m0w0vy4Nc92IOCtwaAefDtVWKaMPae0qEokqCFh/15Etg3mPj9l+0y/QojMsq+32GDL
 FCc4x1guuctj7Dh9w2rpqoJJMnqXSJhRdYAnuBaH1m5ApCPzHjNZOJsEgqVYOMqcq1IK
 z4bmcgqikB0YNciNmYj3+oZnFq+Z3IRAKc7+MbjrKJ0m2yo/N7qQZlR4Wduu+I3SYaAM
 An3oELmPbKJBGAW9gnsznPT0Ku3QQIngN9+ygpAFQEEHuUfYflrAf46HUzwiWP0xvwhX
 EWWA==
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
 Eric Auger <eric.auger@redhat.com>,
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
dHMuCgp2YWRkcl9nZXRfcGZuKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEg
bG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJzLgoK
VW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKUmV2aWV3ZWQtYnk6IEVyaWMg
QXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFZpbmNlbnpvIEZyYXNj
aW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgpSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJp
bmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlw
ZTEuYwppbmRleCBhZGQzNGFkZmFkYzcuLjdiODI4M2UzM2QxMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYworKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90
eXBlMS5jCkBAIC0zODEsNiArMzgxLDggQEAgc3RhdGljIGludCB2YWRkcl9nZXRfcGZuKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyLAogCiAJZG93bl9yZWFkKCZtbS0+
bW1hcF9zZW0pOwogCisJdmFkZHIgPSB1bnRhZ2dlZF9hZGRyKHZhZGRyKTsKKwogCXZtYSA9IGZp
bmRfdm1hX2ludGVyc2VjdGlvbihtbSwgdmFkZHIsIHZhZGRyICsgMSk7CiAKIAlpZiAodm1hICYm
IHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVApIHsKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUt
Z29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
