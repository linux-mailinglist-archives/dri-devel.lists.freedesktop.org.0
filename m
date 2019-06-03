Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DDB33FB5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8AD896E9;
	Tue,  4 Jun 2019 07:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6760D892A5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:56:07 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id q13so4520810vke.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y8tRh8UuVncP1ncRA8ZfIPgOhX9+nAfsBu2vnbYNOEE=;
 b=HXXSBNRxrwwOHNBPZyiOWtCOTUcWN7ougiGL5psXv7ee6Z6xTidud1wti8RV2U9ucA
 216sw7Zx0SBK2FaJYlQycLHc6m4rajiNet4xUMXh+NWozBIJh9Z/EnreBo/ID3SN5/tf
 31Uh0Y6SlQflkyjYzdKbI7Yyh6qSVBoPbKkuJRc/g8s2pQtTlWeAGPGKscwEmKEzk9fr
 nCCr+zNeM+RJPcqQXpOZQ+a3T+wO20YKvK6EO3J+P46PYIpgqDl5xdTbg002hl7NlQHE
 k1WvrkCQCB+1EAr8uYJPONqthF60EZVEHJkbIRTWJmFG1YXEWGCsfePHuYdOv/oHQm+r
 nBIA==
X-Gm-Message-State: APjAAAX+w2q0B3sO6HQVRaZ34RTlzNyYixTGVScFljxeZvQMJF4P5hF+
 8EJ+5FdY08c0I3hSEL7jUGtKoFXqKis+KnPx
X-Google-Smtp-Source: APXvYqzz/ntPC10OZ0frdLABrSNi7hvZ/ytx4Ex3aaENCq428cafLYJMM+5BmbKZZkSR6QrCbMGhJA3iBNJvNJC5
X-Received: by 2002:a9f:25c6:: with SMTP id 64mr157298uaf.36.1559580966349;
 Mon, 03 Jun 2019 09:56:06 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:15 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <31821f3538ddacb7e57e0248e86a3d28f9789d2f.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 13/16] media/v4l2-core,
 arm64: untag user pointers in videobuf_dma_contig_user_get
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=Y8tRh8UuVncP1ncRA8ZfIPgOhX9+nAfsBu2vnbYNOEE=;
 b=eFK1jtlEFrS3m2V50O3J5bSuSe+f8SF2oOEJcYGOiFDh2Xi4MGaW9nDUncCGVcGUyN
 tYL5ptbIsLBKOxSfh5JEibNl8mgQflxa8qzQZCZGbKOMu+ue4btTZbmvk6Kxh+WcG+Wv
 fn/kF4y9wQfMzaBiS9+LkicOpt8tKnLL/K7iTnBUbTxgKs5dHlS/ncUSuv8GobYsG6Cu
 6qM+L38/9FABz5BxD3BPgItX9XL5QdXg0jsVIbHzcM5qVU0wJRygy73ep5mkhIvjeckb
 fTT0sIEfasP+T2Y6+uUP2P0imGCc2+QNF2QVC0kVT6BdFDtQ0zPTYlADXVtguKUh5EC4
 AB9A==
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
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
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
cmd1bWVudHMuCgp2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KCkgdXNlcyBwcm92aWRlZCB1
c2VyIHBvaW50ZXJzIGZvciB2bWEKbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRo
IHVudGFnZ2VkIHBvaW50ZXJzLgoKVW50YWcgdGhlIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24u
CgpBY2tlZC1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVs
Lm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUu
Y29tPgotLS0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYyB8
IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1j
b250aWcuYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYwpp
bmRleCBlMWJmNTBkZjRjNzAuLjhhMWRkZDE0NmIxNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdjRs
Mi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYwpAQCAtMTYwLDYgKzE2MCw3IEBAIHN0YXRpYyB2
b2lkIHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9wdXQoc3RydWN0IHZpZGVvYnVmX2RtYV9jb250
aWdfbWVtb3J5ICptZW0pCiBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQo
c3RydWN0IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5ICptZW0sCiAJCQkJCXN0cnVjdCB2aWRl
b2J1Zl9idWZmZXIgKnZiKQogeworCXVuc2lnbmVkIGxvbmcgdW50YWdnZWRfYmFkZHIgPSB1bnRh
Z2dlZF9hZGRyKHZiLT5iYWRkcik7CiAJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50LT5t
bTsKIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKIAl1bnNpZ25lZCBsb25nIHByZXZfcGZu
LCB0aGlzX3BmbjsKQEAgLTE2NywyMiArMTY4LDIyIEBAIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1h
X2NvbnRpZ191c2VyX2dldChzdHJ1Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwK
IAl1bnNpZ25lZCBpbnQgb2Zmc2V0OwogCWludCByZXQ7CiAKLQlvZmZzZXQgPSB2Yi0+YmFkZHIg
JiB+UEFHRV9NQVNLOworCW9mZnNldCA9IHVudGFnZ2VkX2JhZGRyICYgflBBR0VfTUFTSzsKIAlt
ZW0tPnNpemUgPSBQQUdFX0FMSUdOKHZiLT5zaXplICsgb2Zmc2V0KTsKIAlyZXQgPSAtRUlOVkFM
OwogCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwogCi0Jdm1hID0gZmluZF92bWEobW0sIHZi
LT5iYWRkcik7CisJdm1hID0gZmluZF92bWEobW0sIHVudGFnZ2VkX2JhZGRyKTsKIAlpZiAoIXZt
YSkKIAkJZ290byBvdXRfdXA7CiAKLQlpZiAoKHZiLT5iYWRkciArIG1lbS0+c2l6ZSkgPiB2bWEt
PnZtX2VuZCkKKwlpZiAoKHVudGFnZ2VkX2JhZGRyICsgbWVtLT5zaXplKSA+IHZtYS0+dm1fZW5k
KQogCQlnb3RvIG91dF91cDsKIAogCXBhZ2VzX2RvbmUgPSAwOwogCXByZXZfcGZuID0gMDsgLyog
a2lsbCB3YXJuaW5nICovCi0JdXNlcl9hZGRyZXNzID0gdmItPmJhZGRyOworCXVzZXJfYWRkcmVz
cyA9IHVudGFnZ2VkX2JhZGRyOwogCiAJd2hpbGUgKHBhZ2VzX2RvbmUgPCAobWVtLT5zaXplID4+
IFBBR0VfU0hJRlQpKSB7CiAJCXJldCA9IGZvbGxvd19wZm4odm1hLCB1c2VyX2FkZHJlc3MsICZ0
aGlzX3Bmbik7Ci0tIAoyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
