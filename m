Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A643385
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E42E89467;
	Thu, 13 Jun 2019 07:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ACF8933E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:43:43 +0000 (UTC)
Received: by mail-ot1-x349.google.com with SMTP id h12so7587237otn.18
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=UjHW3gvZNVNgT5aLmmsHnPxo+B7J7BC6tuQvc/RhPNk=;
 b=CE7te8TStoIan2nEP/rwpDzeXYixflmMO9zm2nCrKUX2Dul3r46L6I9d8yv/Ox89lk
 4jjOG+5it6PZ6t2I2CBhcycHo77+eDbRMclkXUR9hpJfu5WDDbCk/GsmbHDgTWlWljvS
 oKJdaWWoPCgajY22BkU4lANcxQBsJMOuDsMjCkJvXyhwxH7XlSsSWJqpWWirQ3/7Thpn
 64gUeFK8E5PYqsAoNnTkucNkLgBfMTHry/UXN71c6QsCKmuadswsvbzTuZeOLb/zkFKr
 5vwtV2AN4MbYNIqgnSS2pDiAAqypRdptVBnXxzTTpIIvi8C/LJdJaNruav/36nJnD038
 sxSQ==
X-Gm-Message-State: APjAAAXQMQEydzd3Yn4AFvd85d1zOIrOzBl3jwL2ESLJ8dXww9ZGuyTE
 8EGDG75EetnuJOK6lYkORUsYjZVWW3tbO9xJ
X-Google-Smtp-Source: APXvYqwN3f56c3YdzV4vuBZtnTaXMq2rkbV7EZJhl+9vuDir+VdtrZMmSzDSSPuiOLJaxWwDb81r7VAwTgFT1eUN
X-Received: by 2002:a9d:764d:: with SMTP id o13mr6499138otl.298.1560339823090; 
 Wed, 12 Jun 2019 04:43:43 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:19 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <a76c014f9b12a082d31ef1459907cabdab78491e.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 02/15] lib, arm64: untag user pointers in strn*_user
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
 bh=UjHW3gvZNVNgT5aLmmsHnPxo+B7J7BC6tuQvc/RhPNk=;
 b=wWQdCeaEB2u6K2FokoVH57TiuY9+YM+iloWJZ9olfqp0zjmIdmC5f6DPCzUKmsxGdy
 S65EVOJIDT5V4zwCQfqNTJzphOcFWfUmY+gXBOeFncv77kXLYdKYGCkdMxc+OyweaWX0
 0fKTo4iZRRAvEu0L5K9N5O0E1jscX+Pk92PzQ1PknQ2YOc6xMrIj1RN7n/IEUROoLRHK
 DSyTNlm/Sr+vicrs5WJhiUx/1nLhQ5Q4ACjS55YPvH7eOOqFTP/CfYXsftMzptdGowR3
 ikQ6jhRMQBxQ3FPli1xBTZa23yNKdUvKN2sR5HTTLiPeqs1dY61XYlyLOGrjNBMaj6hd
 3iow==
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
cmd1bWVudHMuCgpzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2Vy
IGFkZHJlc3NlcyBhcyBhcmd1bWVudHMsIGFuZApkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBw
YXRoIGFzIGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKbmVlZCB0byBoYW5k
bGUgdGhlIGNhc2Ugb2YgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHNlcGFyYXRlbHkuCgpVbnRhZyB1
c2VyIHBvaW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCgpOb3RlLCB0aGF0IHRoaXMg
cGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0KdmFs
aWRpdHkgY2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1l
bW9yeSBhY2Nlc3Nlcy4KClJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlkLmF6aXpAb3Jh
Y2xlLmNvbT4KQWNrZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpSZXZp
ZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGxp
Yi9zdHJuY3B5X2Zyb21fdXNlci5jIHwgMyArKy0KIGxpYi9zdHJubGVuX3VzZXIuYyAgICAgIHwg
MyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jIGIvbGliL3N0cm5jcHlfZnJvbV91
c2VyLmMKaW5kZXggMDIzYmE5ZjNiOTlmLi5kY2NiOTVhZjYwMDMgMTAwNjQ0Ci0tLSBhL2xpYi9z
dHJuY3B5X2Zyb21fdXNlci5jCisrKyBiL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jCkBAIC02LDYg
KzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgorI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAK
ICNpbmNsdWRlIDxhc20vYnl0ZW9yZGVyLmg+CiAjaW5jbHVkZSA8YXNtL3dvcmQtYXQtYS10aW1l
Lmg+CkBAIC0xMDgsNyArMTA5LDcgQEAgbG9uZyBzdHJuY3B5X2Zyb21fdXNlcihjaGFyICpkc3Qs
IGNvbnN0IGNoYXIgX191c2VyICpzcmMsIGxvbmcgY291bnQpCiAJCXJldHVybiAwOwogCiAJbWF4
X2FkZHIgPSB1c2VyX2FkZHJfbWF4KCk7Ci0Jc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZylzcmM7
CisJc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHNyYyk7CiAJaWYgKGxp
a2VseShzcmNfYWRkciA8IG1heF9hZGRyKSkgewogCQl1bnNpZ25lZCBsb25nIG1heCA9IG1heF9h
ZGRyIC0gc3JjX2FkZHI7CiAJCWxvbmcgcmV0dmFsOwpkaWZmIC0tZ2l0IGEvbGliL3N0cm5sZW5f
dXNlci5jIGIvbGliL3N0cm5sZW5fdXNlci5jCmluZGV4IDdmMmRiM2ZlMzExZi4uMjhmZjU1NGEx
YmU4IDEwMDY0NAotLS0gYS9saWIvc3Rybmxlbl91c2VyLmMKKysrIGIvbGliL3N0cm5sZW5fdXNl
ci5jCkBAIC0yLDYgKzIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUg
PGxpbnV4L2V4cG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KKyNpbmNsdWRlIDxs
aW51eC9tbS5oPgogCiAjaW5jbHVkZSA8YXNtL3dvcmQtYXQtYS10aW1lLmg+CiAKQEAgLTEwOSw3
ICsxMTAsNyBAQCBsb25nIHN0cm5sZW5fdXNlcihjb25zdCBjaGFyIF9fdXNlciAqc3RyLCBsb25n
IGNvdW50KQogCQlyZXR1cm4gMDsKIAogCW1heF9hZGRyID0gdXNlcl9hZGRyX21heCgpOwotCXNy
Y19hZGRyID0gKHVuc2lnbmVkIGxvbmcpc3RyOworCXNyY19hZGRyID0gKHVuc2lnbmVkIGxvbmcp
dW50YWdnZWRfYWRkcihzdHIpOwogCWlmIChsaWtlbHkoc3JjX2FkZHIgPCBtYXhfYWRkcikpIHsK
IAkJdW5zaWduZWQgbG9uZyBtYXggPSBtYXhfYWRkciAtIHNyY19hZGRyOwogCQlsb25nIHJldHZh
bDsKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
