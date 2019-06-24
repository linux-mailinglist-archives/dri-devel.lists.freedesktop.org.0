Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5652488
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739316E02D;
	Tue, 25 Jun 2019 07:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6004489B69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:45 +0000 (UTC)
Received: by mail-vs1-xe4a.google.com with SMTP id i6so3947606vsp.15
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v2NimiCS5k+CASkvLG6PtbLfdsWbdfRiVRoN94NNZxk=;
 b=UVfIZghgwYvxz09Zg6S9jN2kT2Tdm9g3/6JWC7c/KdtjD1FeMLgW2Yc9wXi+Dvmnpz
 bQuECOgp5Y635LK+U96GGp8KrMprJrCkjZz4NC1L2ecNY5hSyN1CKd4YLMm3A2i1PRtb
 dfmaNSom3q0r69/ef8Wn6zdK4eZ92hHgPafUTLvHfSG47dLYVcmiOvMvTOHMAkZe8aA3
 LWZxDyDKiovq0u8Bfftx1DcT4qGo77ecYBRjuOaDqYCXYViMZ7Gni8nP126StZuyqBsc
 QsNKmjbOtzLGW7S6AfDR7KYjYYjs8qjIwwtzXJmUEALQBxLK2osCSClPVNTxL17gbN30
 bECQ==
X-Gm-Message-State: APjAAAX4oZ5KyFoufgXq16NdZQuGuCVXUK0/Rd64Z+TKVqdwCernDfi6
 TvjWzyITIYkur67DGnd18K1uztc25tzofkZ/
X-Google-Smtp-Source: APXvYqzc7XeUiJjoodFNDUni2Tg0W5zegM0Bn90vNeBUMt6R6CtCKJP3h/iCRJwisxZh4IB/OpGm7X901/iCtFh1
X-Received: by 2002:a1f:ccc4:: with SMTP id c187mr4785454vkg.56.1561386824379; 
 Mon, 24 Jun 2019 07:33:44 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:57 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <f28f0374a8ed0985d045ce1959855c1e35dc138a.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 12/15] media/v4l2-core: untag user pointers in
 videobuf_dma_contig_user_get
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
 bh=v2NimiCS5k+CASkvLG6PtbLfdsWbdfRiVRoN94NNZxk=;
 b=R52F0Fd2shfIFR4q0bGdXx41jOC2qnPJSQkzVjeQeg54HgHR1/LLyouZcbT5pvU9ph
 IHRux4iRMn4iYjvIDENfWOq45LSEDCPbYqCOQOQrImK8uyieit/JhMM59l/PH48sLiy7
 OI6R5A3fMrdUIOLYn31VebhgCxKDAeunCFpurDmVgRp0CrVsEJYad0EcCQYYY+TsPx7Q
 wTuXqrZzi+DWvrwVhM13ZxkTrFcZ7WmDz7dFzgsP/AanzslvHIEdFMM6FuW5iowuC8jA
 iMOcgKpuXLtNG/lXst1VUVtGfDLMhPKtSnYwCtLyaY9LkXb2nkdEdjD68Dx6hEKz0c54
 IyJQ==
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

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkg
dG8gYWxsb3cgdG8gcGFzcwp0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUg
c2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCgp2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KCkgdXNlcyBwcm92aWRlZCB1c2VyIHBv
aW50ZXJzIGZvciB2bWEKbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRoIHVudGFn
Z2VkIHBvaW50ZXJzLgoKVW50YWcgdGhlIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24uCgpSZXZp
ZXdlZC1ieTogS2hhbGlkIEF6aXogPGtoYWxpZC5heml6QG9yYWNsZS5jb20+ClJldmlld2VkLWJ5
OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6IE1hdXJvIENhcnZh
bGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KLS0tCiBkcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgYi9kcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKaW5kZXggMDQ5MTEyMmIwM2M0Li5lYzU1
NGVmZjI5YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRt
YS1jb250aWcuYworKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29u
dGlnLmMKQEAgLTE1Nyw2ICsxNTcsNyBAQCBzdGF0aWMgdm9pZCB2aWRlb2J1Zl9kbWFfY29udGln
X3VzZXJfcHV0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtKQogc3RhdGlj
IGludCB2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KHN0cnVjdCB2aWRlb2J1Zl9kbWFfY29u
dGlnX21lbW9yeSAqbWVtLAogCQkJCQlzdHJ1Y3QgdmlkZW9idWZfYnVmZmVyICp2YikKIHsKKwl1
bnNpZ25lZCBsb25nIHVudGFnZ2VkX2JhZGRyID0gdW50YWdnZWRfYWRkcih2Yi0+YmFkZHIpOwog
CXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07CiAJc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWE7CiAJdW5zaWduZWQgbG9uZyBwcmV2X3BmbiwgdGhpc19wZm47CkBAIC0xNjQsMjIg
KzE2NSwyMiBAQCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQoc3RydWN0
IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5ICptZW0sCiAJdW5zaWduZWQgaW50IG9mZnNldDsK
IAlpbnQgcmV0OwogCi0Jb2Zmc2V0ID0gdmItPmJhZGRyICYgflBBR0VfTUFTSzsKKwlvZmZzZXQg
PSB1bnRhZ2dlZF9iYWRkciAmIH5QQUdFX01BU0s7CiAJbWVtLT5zaXplID0gUEFHRV9BTElHTih2
Yi0+c2l6ZSArIG9mZnNldCk7CiAJcmV0ID0gLUVJTlZBTDsKIAogCWRvd25fcmVhZCgmbW0tPm1t
YXBfc2VtKTsKIAotCXZtYSA9IGZpbmRfdm1hKG1tLCB2Yi0+YmFkZHIpOworCXZtYSA9IGZpbmRf
dm1hKG1tLCB1bnRhZ2dlZF9iYWRkcik7CiAJaWYgKCF2bWEpCiAJCWdvdG8gb3V0X3VwOwogCi0J
aWYgKCh2Yi0+YmFkZHIgKyBtZW0tPnNpemUpID4gdm1hLT52bV9lbmQpCisJaWYgKCh1bnRhZ2dl
ZF9iYWRkciArIG1lbS0+c2l6ZSkgPiB2bWEtPnZtX2VuZCkKIAkJZ290byBvdXRfdXA7CiAKIAlw
YWdlc19kb25lID0gMDsKIAlwcmV2X3BmbiA9IDA7IC8qIGtpbGwgd2FybmluZyAqLwotCXVzZXJf
YWRkcmVzcyA9IHZiLT5iYWRkcjsKKwl1c2VyX2FkZHJlc3MgPSB1bnRhZ2dlZF9iYWRkcjsKIAog
CXdoaWxlIChwYWdlc19kb25lIDwgKG1lbS0+c2l6ZSA+PiBQQUdFX1NISUZUKSkgewogCQlyZXQg
PSBmb2xsb3dfcGZuKHZtYSwgdXNlcl9hZGRyZXNzLCAmdGhpc19wZm4pOwotLSAKMi4yMi4wLjQx
MC5nZDhmZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
