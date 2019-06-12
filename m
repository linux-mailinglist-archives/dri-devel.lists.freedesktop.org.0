Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E143381
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8189363;
	Thu, 13 Jun 2019 07:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A778932D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:15 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id v15so15198507ybe.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OMWTVS19S/O2L7wjAg8YO34JfVmTuzDlFYDWpvnlfdc=;
 b=msugR2qMtptXIYB+j7YkJPIHzzEhX43N1Ni8fGkUUb/TnG0brkHCK+S4AB7Nv0NciF
 +Ow07AGe1BhJNwTiA9hWF/6WMoIMmHokNMI7F+VpdK5iZEYlezHJj1+FBWfnHjSoVxPI
 vDj+4wvmK4aNyk9vo7NvrFhv8HSbVSyryLB9EYRCM5dvfzlDNlE7K7SNoSXdaZcNnE0A
 UgDThLFHtzulpe1ROCQhSAJWNtjzbSwmxDKE4ymUstDaGgto/f3jMFZ7atjzpePPOYne
 /cNJAqnvb7M/z1Ax/ZwYgZrL2b3CbrFuJPfnCjrNg+xVGG7w67DVq8CYY3QpXzQjQsWS
 1ySw==
X-Gm-Message-State: APjAAAUd7qbmHyPM5u54D5UghAo1YguZGSQ3eqr0cxBGejwKWwZ+nbVG
 939Z6/AZAdSqIGUK3IA/GGMVYQyyxT15NKcH
X-Google-Smtp-Source: APXvYqwTs0S91VLJ1vEb2xUG3SN6RjfUTygp4K8Hjte1QQ8AktyAJh0LJ+M6BJ5qwoi87JfKLCpvnOyNNEEmSEtd
X-Received: by 2002:a25:aab0:: with SMTP id t45mr38754945ybi.201.1560339854764; 
 Wed, 12 Jun 2019 04:44:14 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:29 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <7fbcdbe16a2bd99e92eb4541248469738d89a122.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 12/15] media/v4l2-core,
 arm64: untag user pointers in videobuf_dma_contig_user_get
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=OMWTVS19S/O2L7wjAg8YO34JfVmTuzDlFYDWpvnlfdc=;
 b=l/pAL0pYNwxIjhI4A5Di3+u8zRy7KDPlydIoJClA3OuILFZkNAGW7KJJpakHJKu6oE
 BOdwx+v3Y6mB0EaDg1WhpBGkC44sbC2cWM9OPunZvHIIMbKjR7+B/dGr9AjLsLmz2Olt
 nLMYnF0Wzf15zXWsTdJBm9qmaTa4PXWly/FRd7uizPU6BFseaNjpN6LtFlJq58pOQv7T
 WsZKhldlre+UFCD7WiBxmS6BBO31lObcc7zusnLdA80L2jwrzKGvI3ypNGCThs2lIqG6
 VybQ3v2ZWx5KHhiRN49MNNAagP8G3S94nC+koOMwbLACD7/N8Wf3tprbj1wNC/YGyAaz
 DFPw==
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
CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkFja2VkLWJ5
OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQog
ZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwgOSArKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIGIv
ZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCmluZGV4IGUxYmY1
MGRmNGM3MC4uOGExZGRkMTQ2YjE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlk
ZW9idWYtZG1hLWNvbnRpZy5jCkBAIC0xNjAsNiArMTYwLDcgQEAgc3RhdGljIHZvaWQgdmlkZW9i
dWZfZG1hX2NvbnRpZ191c2VyX3B1dChzdHJ1Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkg
Km1lbSkKIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dldChzdHJ1Y3Qgdmlk
ZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwKIAkJCQkJc3RydWN0IHZpZGVvYnVmX2J1ZmZl
ciAqdmIpCiB7CisJdW5zaWduZWQgbG9uZyB1bnRhZ2dlZF9iYWRkciA9IHVudGFnZ2VkX2FkZHIo
dmItPmJhZGRyKTsKIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwogCXN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hOwogCXVuc2lnbmVkIGxvbmcgcHJldl9wZm4sIHRoaXNfcGZu
OwpAQCAtMTY3LDIyICsxNjgsMjIgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9kbWFfY29udGlnX3Vz
ZXJfZ2V0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtLAogCXVuc2lnbmVk
IGludCBvZmZzZXQ7CiAJaW50IHJldDsKIAotCW9mZnNldCA9IHZiLT5iYWRkciAmIH5QQUdFX01B
U0s7CisJb2Zmc2V0ID0gdW50YWdnZWRfYmFkZHIgJiB+UEFHRV9NQVNLOwogCW1lbS0+c2l6ZSA9
IFBBR0VfQUxJR04odmItPnNpemUgKyBvZmZzZXQpOwogCXJldCA9IC1FSU5WQUw7CiAKIAlkb3du
X3JlYWQoJm1tLT5tbWFwX3NlbSk7CiAKLQl2bWEgPSBmaW5kX3ZtYShtbSwgdmItPmJhZGRyKTsK
Kwl2bWEgPSBmaW5kX3ZtYShtbSwgdW50YWdnZWRfYmFkZHIpOwogCWlmICghdm1hKQogCQlnb3Rv
IG91dF91cDsKIAotCWlmICgodmItPmJhZGRyICsgbWVtLT5zaXplKSA+IHZtYS0+dm1fZW5kKQor
CWlmICgodW50YWdnZWRfYmFkZHIgKyBtZW0tPnNpemUpID4gdm1hLT52bV9lbmQpCiAJCWdvdG8g
b3V0X3VwOwogCiAJcGFnZXNfZG9uZSA9IDA7CiAJcHJldl9wZm4gPSAwOyAvKiBraWxsIHdhcm5p
bmcgKi8KLQl1c2VyX2FkZHJlc3MgPSB2Yi0+YmFkZHI7CisJdXNlcl9hZGRyZXNzID0gdW50YWdn
ZWRfYmFkZHI7CiAKIAl3aGlsZSAocGFnZXNfZG9uZSA8IChtZW0tPnNpemUgPj4gUEFHRV9TSElG
VCkpIHsKIAkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHVzZXJfYWRkcmVzcywgJnRoaXNfcGZuKTsK
LS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
