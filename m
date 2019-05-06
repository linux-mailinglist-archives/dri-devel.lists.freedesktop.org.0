Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1115E1F
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D391E89E05;
	Tue,  7 May 2019 07:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE7C89AB7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:31:51 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id g128so26093106ywf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qJJU2gbhvvSzaaRZNAk/AylUL7YQ1I9YBdVQ8VYA/h0=;
 b=Jc0gvtTQj7Pa+6Dlnvo+5k46ZK0u/gxUyi1m3EI9WFxOSxbeO9yOnA1xeVzdacR6Ci
 o3JM1f/GGdkpsRYaTKecSZMBWRDGx9sHmNFN6qvqaVSdan6UsCVnzVoEOa6wY7IiEYVa
 vUmIYDFC0PfJN+SWUnqWKixgbxPTjltpQvLq+zI2hn4PmAWcgJ/gXWV06UohnOTtn2gf
 DV5NkM8b2Vu/NC2r/INhv6U0QKOal5VrputpFmOSPjUbJ8HbdhVujvnOc55aoAQZfc02
 L8Ch5wpn//uZnBuY6UVw5yu1kVg3Hzo7LIpUUMZ3AH0otV3r0ba+sHPFhnCD1WlyWOg5
 RXZw==
X-Gm-Message-State: APjAAAVOsRDAx4HLzzoTBxgxfVcqTQtK4AUCfE4l7r7scS0oN6BsNI5V
 YXeNpaADlAJODsZowpzf97MQbnmQnPqQBnMT
X-Google-Smtp-Source: APXvYqx1X9tJcqBzNMWoEfXSSulDx8NO+a1TdtkQwmCv7glkGcm++BXem7IIU8nDFZviDaBVQ7bW4qmRV4r3Auad
X-Received: by 2002:a25:2a17:: with SMTP id q23mr16755885ybq.195.1557160310462; 
 Mon, 06 May 2019 09:31:50 -0700 (PDT)
Date: Mon,  6 May 2019 18:31:00 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <b7999d13af54eb3ed8d7b0192397c7cde3df0b28.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 14/17] media/v4l2-core,
 arm64: untag user pointers in videobuf_dma_contig_user_get
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
 bh=qJJU2gbhvvSzaaRZNAk/AylUL7YQ1I9YBdVQ8VYA/h0=;
 b=smw+2+zeQRYDg9lMdhXKhP6q2UgWQk5tdiALYOGrpKFur5CJhfOg9OO/PZTfQT7ZwY
 RvP2Hk/sSL7ML8WOTNeWv38qmUNAe4g4KhC0ua28+5atrFm7K5fmvkLjk0Db/ljqag0b
 dQjecdgCCDsZyAajxBKxJc7LsxcMY95MEt9IiglDE0kwt30ExqYblax2XRbyRPQRXMO4
 E+sey04rspIj0vK4v2o8+jJjIqc7WmoTjK96Ljfvnn/wyfRgdPoxhrZ+nqZ5Pgf+9DsA
 QtQ6iTRFCgpCJVB7xCQGyTJqnI3tF0Os9MEQkOzATYUN++U4ys3fnY4AQGWE9mngxzPC
 elwg==
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
cmd1bWVudHMuCgp2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KCkgdXNlcyBwcm92aWRlZCB1
c2VyIHBvaW50ZXJzIGZvciB2bWEKbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRo
IHVudGFnZ2VkIHBvaW50ZXJzLgoKVW50YWcgdGhlIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+
Ci0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwgOSAr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRp
Zy5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCmluZGV4
IGUxYmY1MGRmNGM3MC4uOGExZGRkMTQ2YjE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0
bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNv
cmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCkBAIC0xNjAsNiArMTYwLDcgQEAgc3RhdGljIHZvaWQg
dmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX3B1dChzdHJ1Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19t
ZW1vcnkgKm1lbSkKIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dldChzdHJ1
Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwKIAkJCQkJc3RydWN0IHZpZGVvYnVm
X2J1ZmZlciAqdmIpCiB7CisJdW5zaWduZWQgbG9uZyB1bnRhZ2dlZF9iYWRkciA9IHVudGFnZ2Vk
X2FkZHIodmItPmJhZGRyKTsKIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwog
CXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwogCXVuc2lnbmVkIGxvbmcgcHJldl9wZm4sIHRo
aXNfcGZuOwpAQCAtMTY3LDIyICsxNjgsMjIgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9kbWFfY29u
dGlnX3VzZXJfZ2V0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtLAogCXVu
c2lnbmVkIGludCBvZmZzZXQ7CiAJaW50IHJldDsKIAotCW9mZnNldCA9IHZiLT5iYWRkciAmIH5Q
QUdFX01BU0s7CisJb2Zmc2V0ID0gdW50YWdnZWRfYmFkZHIgJiB+UEFHRV9NQVNLOwogCW1lbS0+
c2l6ZSA9IFBBR0VfQUxJR04odmItPnNpemUgKyBvZmZzZXQpOwogCXJldCA9IC1FSU5WQUw7CiAK
IAlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7CiAKLQl2bWEgPSBmaW5kX3ZtYShtbSwgdmItPmJh
ZGRyKTsKKwl2bWEgPSBmaW5kX3ZtYShtbSwgdW50YWdnZWRfYmFkZHIpOwogCWlmICghdm1hKQog
CQlnb3RvIG91dF91cDsKIAotCWlmICgodmItPmJhZGRyICsgbWVtLT5zaXplKSA+IHZtYS0+dm1f
ZW5kKQorCWlmICgodW50YWdnZWRfYmFkZHIgKyBtZW0tPnNpemUpID4gdm1hLT52bV9lbmQpCiAJ
CWdvdG8gb3V0X3VwOwogCiAJcGFnZXNfZG9uZSA9IDA7CiAJcHJldl9wZm4gPSAwOyAvKiBraWxs
IHdhcm5pbmcgKi8KLQl1c2VyX2FkZHJlc3MgPSB2Yi0+YmFkZHI7CisJdXNlcl9hZGRyZXNzID0g
dW50YWdnZWRfYmFkZHI7CiAKIAl3aGlsZSAocGFnZXNfZG9uZSA8IChtZW0tPnNpemUgPj4gUEFH
RV9TSElGVCkpIHsKIAkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHVzZXJfYWRkcmVzcywgJnRoaXNf
cGZuKTsKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
