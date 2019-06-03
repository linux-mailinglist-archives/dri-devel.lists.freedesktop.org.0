Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAC133FB3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D68896A5;
	Tue,  4 Jun 2019 07:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BAC892AE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 17:46:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so10449159qtk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 10:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3YD9QwJxecxdMHZGSRuYOcVyiXHhODdQ+7hG9X3IFEc=;
 b=qzNSTC18Y6AwImWHmPp2ijE8+52q3twzQh8ZN7R8rTWQ8p7MGh2kXFwkg/M5SR4N2G
 6brBZdly9NO2nzsgiXJQcgsaXAUIjjAWMmTqYPEXmD+OBZRK4dIrOdUEwkmQGNIDb8yP
 551fDuBVdjukYqJrEL9VvHn4awavk9fBTFeXSce3VFppIZJraoPA01/1VpnjBq1nQxrt
 +noSiLMTL9rl/iW54X8bpNIb6uX1WOtlF8KOaFJHLnl54h7e2DTigqwNJ7rKFlZMLHyM
 6QGm9mstMgQgRdsk1Bbo+8s1XLNigw0sT1K/2iBp1JpG9IeEq11B/xCrW2mNwwOrSHie
 OQ+w==
X-Gm-Message-State: APjAAAWscSVLuf9HNynGPalWpKwp2GiMPLHRj2uCeR/wArgMvmjaH0SW
 n7ZfdqB5c1CQ3uqAX6RAMfZKHA==
X-Google-Smtp-Source: APXvYqx+ClbIfZmOUdY0b04TFbjW+3r9mnjIe7N0zaIfZmDOHWubw4QUOroagi67b9WugppzpkzydA==
X-Received: by 2002:ac8:7381:: with SMTP id t1mr24802701qtp.387.1559583980558; 
 Mon, 03 Jun 2019 10:46:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m40sm12874710qtm.2.2019.06.03.10.46.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 10:46:19 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hXr2J-00032t-AT; Mon, 03 Jun 2019 14:46:19 -0300
Date: Mon, 3 Jun 2019 14:46:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 12/16] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
Message-ID: <20190603174619.GC11474@ziepe.ca>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3YD9QwJxecxdMHZGSRuYOcVyiXHhODdQ+7hG9X3IFEc=;
 b=Y8xQhEUl5VIp1CHI2GNhUWumFeridnSrDVLR4ophf+TEEqb9RYCBYUuzTaKnpS0N95
 PodsZw5QrRzXwcVAdLU8QbPx8UtppQyKINjpafz63KgI0mbZL1RBR/HG+Aw16qS1mL8x
 GbfoGarwImiN/E4mJOvSlkb1cLIeV/RY7kSfMlxm7UZhj+NafqRJ9xFMGOVfHXfBQNL8
 3KhvQIu3nzrYZ9gVumHcKZbTTOBDGZbVoC0PmchuHZfBO5itRE+CWVGivs8JV9Bdb68S
 oKMm5wdMIjQdNVuG5jJ5CkpKuMh+/TZa/xggfv/76T6HlvfgScQBIZzwwZTZ5LwtflBg
 nfEg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MTRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gaWJfdXZlcmJzXyhyZSlyZWdfbXIoKSB1c2Ug
cHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMgKHRocm91Z2gKPiBlLmcuIG1s
eDRfZ2V0X3VtZW1fbXIoKSksIHdoaWNoIGNhbiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBw
b2ludGVycy4KPiAKPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoZXNlIGZ1bmN0aW9ucy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4K
PiAgZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jIHwgNCArKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZp
bmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJz
X2NtZC5jCj4gaW5kZXggNWEzYTE3ODBjZWVhLi5mODhlZTczM2U2MTcgMTAwNjQ0Cj4gKysrIGIv
ZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jCj4gQEAgLTcwOSw2ICs3MDksOCBA
QCBzdGF0aWMgaW50IGliX3V2ZXJic19yZWdfbXIoc3RydWN0IHV2ZXJic19hdHRyX2J1bmRsZSAq
YXR0cnMpCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICsJY21kLnN0YXJ0ID0g
dW50YWdnZWRfYWRkcihjbWQuc3RhcnQpOwo+ICsKPiAgCWlmICgoY21kLnN0YXJ0ICYgflBBR0Vf
TUFTSykgIT0gKGNtZC5oY2FfdmEgJiB+UEFHRV9NQVNLKSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsK
CkkgZmVlbCBsaWtlIHdlIHNob3VsZG4ndCB0aGF2ZSB0byBkbyB0aGlzIGhlcmUsIHN1cmVseSB0
aGUgY21kLnN0YXJ0CnNob3VsZCBmbG93IHVubW9kaWZpZWQgdG8gZ2V0X3VzZXJfcGFnZXMsIGFu
ZCBndXAgc2hvdWxkIHVudGFnIGl0PwoKaWUsIHRoaXMgc29ydCBvZiBkaXJlY3Rpb24gZm9yIHRo
ZSBJQiBjb2RlICh0aGlzIHdvdWxkIGJlIGEgZ2lhbnQKcGF0Y2gsIHNvIEkgZGlkbid0IGhhdmUg
dGltZSB0byB3cml0ZSBpdCBhbGwsIGJ1dCBJIHRoaW5rIGl0IGlzIG11Y2gKc2FuZXIpOgoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYyBiL2RyaXZlcnMvaW5maW5p
YmFuZC9jb3JlL3VtZW0uYwppbmRleCA1NDYyOGVmODc5ZjBjZS4uN2IzYjczNmM4N2MyNTMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYworKysgYi9kcml2ZXJzL2lu
ZmluaWJhbmQvY29yZS91bWVtLmMKQEAgLTE5Myw3ICsxOTMsNyBAQCBFWFBPUlRfU1lNQk9MKGli
X3VtZW1fZmluZF9iZXN0X3Bnc3opOwogICogQGFjY2VzczogSUJfQUNDRVNTX3h4eCBmbGFncyBm
b3IgbWVtb3J5IGJlaW5nIHBpbm5lZAogICogQGRtYXN5bmM6IGZsdXNoIGluLWZsaWdodCBETUEg
d2hlbiB0aGUgbWVtb3J5IHJlZ2lvbiBpcyB3cml0dGVuCiAgKi8KLXN0cnVjdCBpYl91bWVtICpp
Yl91bWVtX2dldChzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1bnNpZ25lZCBsb25nIGFkZHIsCitz
dHJ1Y3QgaWJfdW1lbSAqaWJfdW1lbV9nZXQoc3RydWN0IGliX3VkYXRhICp1ZGF0YSwgdm9pZCBf
X3VzZXIgKmFkZHIsCiAJCQkgICAgc2l6ZV90IHNpemUsIGludCBhY2Nlc3MsIGludCBkbWFzeW5j
KQogewogCXN0cnVjdCBpYl91Y29udGV4dCAqY29udGV4dDsKQEAgLTIwMSw3ICsyMDEsNyBAQCBz
dHJ1Y3QgaWJfdW1lbSAqaWJfdW1lbV9nZXQoc3RydWN0IGliX3VkYXRhICp1ZGF0YSwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAogCXN0cnVjdCBwYWdlICoqcGFnZV9saXN0OwogCXVuc2lnbmVkIGxvbmcg
bG9ja19saW1pdDsKIAl1bnNpZ25lZCBsb25nIG5ld19waW5uZWQ7Ci0JdW5zaWduZWQgbG9uZyBj
dXJfYmFzZTsKKwl2b2lkIF9fdXNlciAqY3VyX2Jhc2U7CiAJc3RydWN0IG1tX3N0cnVjdCAqbW07
CiAJdW5zaWduZWQgbG9uZyBucGFnZXM7CiAJaW50IHJldDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2
ZXJic19jbWQuYwppbmRleCA1YTNhMTc4MGNlZWE0ZC4uOTQzODllN2YxMjM3MWYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYworKysgYi9kcml2ZXJzL2lu
ZmluaWJhbmQvY29yZS91dmVyYnNfY21kLmMKQEAgLTczNSw3ICs3MzUsOCBAQCBzdGF0aWMgaW50
IGliX3V2ZXJic19yZWdfbXIoc3RydWN0IHV2ZXJic19hdHRyX2J1bmRsZSAqYXR0cnMpCiAJCX0K
IAl9CiAKLQltciA9IHBkLT5kZXZpY2UtPm9wcy5yZWdfdXNlcl9tcihwZCwgY21kLnN0YXJ0LCBj
bWQubGVuZ3RoLCBjbWQuaGNhX3ZhLAorCW1yID0gcGQtPmRldmljZS0+b3BzLnJlZ191c2VyX21y
KHBkLCB1NjRfdG9fdXNlcl9wdHIoY21kLnN0YXJ0KSwKKwkJCQkJIGNtZC5sZW5ndGgsIGNtZC5o
Y2FfdmEsCiAJCQkJCSBjbWQuYWNjZXNzX2ZsYWdzLAogCQkJCQkgJmF0dHJzLT5kcml2ZXJfdWRh
dGEpOwogCWlmIChJU19FUlIobXIpKSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQv
aHcvbWx4NS9tci5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDUvbXIuYwppbmRleCA0ZDAz
Mzc5NmRjZmNjMi4uYmRkYmI5NTIwODJmYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFu
ZC9ody9tbHg1L21yLmMKKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDUvbXIuYwpAQCAt
Nzg2LDcgKzc4Niw3IEBAIHN0YXRpYyBpbnQgbXJfY2FjaGVfbWF4X29yZGVyKHN0cnVjdCBtbHg1
X2liX2RldiAqZGV2KQogfQogCiBzdGF0aWMgaW50IG1yX3VtZW1fZ2V0KHN0cnVjdCBtbHg1X2li
X2RldiAqZGV2LCBzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLAotCQkgICAgICAgdTY0IHN0YXJ0LCB1
NjQgbGVuZ3RoLCBpbnQgYWNjZXNzX2ZsYWdzLAorCQkgICAgICAgdm9pZCBfX3VzZXIgKnN0YXJ0
LCB1NjQgbGVuZ3RoLCBpbnQgYWNjZXNzX2ZsYWdzLAogCQkgICAgICAgc3RydWN0IGliX3VtZW0g
Kip1bWVtLCBpbnQgKm5wYWdlcywgaW50ICpwYWdlX3NoaWZ0LAogCQkgICAgICAgaW50ICpuY29u
dCwgaW50ICpvcmRlcikKIHsKQEAgLTEyNjIsOCArMTI2Miw4IEBAIHN0cnVjdCBpYl9tciAqbWx4
NV9pYl9yZWdfZG1fbXIoc3RydWN0IGliX3BkICpwZCwgc3RydWN0IGliX2RtICpkbSwKIAkJCQkg
YXR0ci0+YWNjZXNzX2ZsYWdzLCBtb2RlKTsKIH0KIAotc3RydWN0IGliX21yICptbHg1X2liX3Jl
Z191c2VyX21yKHN0cnVjdCBpYl9wZCAqcGQsIHU2NCBzdGFydCwgdTY0IGxlbmd0aCwKLQkJCQkg
IHU2NCB2aXJ0X2FkZHIsIGludCBhY2Nlc3NfZmxhZ3MsCitzdHJ1Y3QgaWJfbXIgKm1seDVfaWJf
cmVnX3VzZXJfbXIoc3RydWN0IGliX3BkICpwZCwgdm9pZCBfX3VzZXIgKnN0YXJ0LAorCQkJCSAg
dTY0IGxlbmd0aCwgdTY0IHZpcnRfYWRkciwgaW50IGFjY2Vzc19mbGFncywKIAkJCQkgIHN0cnVj
dCBpYl91ZGF0YSAqdWRhdGEpCiB7CiAJc3RydWN0IG1seDVfaWJfZGV2ICpkZXYgPSB0b19tZGV2
KHBkLT5kZXZpY2UpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9yZG1hL2liX3ZlcmJzLmggYi9pbmNs
dWRlL3JkbWEvaWJfdmVyYnMuaAppbmRleCBlYzY0NDY4NjRiMDhlOS4uYjNjOGVhYWEzNWM3NjAg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvcmRtYS9pYl92ZXJicy5oCisrKyBiL2luY2x1ZGUvcmRtYS9p
Yl92ZXJicy5oCkBAIC0yNDY0LDggKzI0NjQsOCBAQCBzdHJ1Y3QgaWJfZGV2aWNlX29wcyB7CiAJ
c3RydWN0IGliX21yICooKnJlZ191c2VyX21yKShzdHJ1Y3QgaWJfcGQgKnBkLCB1NjQgc3RhcnQs
IHU2NCBsZW5ndGgsCiAJCQkJICAgICB1NjQgdmlydF9hZGRyLCBpbnQgbXJfYWNjZXNzX2ZsYWdz
LAogCQkJCSAgICAgc3RydWN0IGliX3VkYXRhICp1ZGF0YSk7Ci0JaW50ICgqcmVyZWdfdXNlcl9t
cikoc3RydWN0IGliX21yICptciwgaW50IGZsYWdzLCB1NjQgc3RhcnQsIHU2NCBsZW5ndGgsCi0J
CQkgICAgIHU2NCB2aXJ0X2FkZHIsIGludCBtcl9hY2Nlc3NfZmxhZ3MsCisJaW50ICgqcmVyZWdf
dXNlcl9tcikoc3RydWN0IGliX21yICptciwgaW50IGZsYWdzLCB2b2lkIF9fdXNlciAqc3RhcnQs
CisJCQkgICAgIHU2NCBsZW5ndGgsIHU2NCB2aXJ0X2FkZHIsIGludCBtcl9hY2Nlc3NfZmxhZ3Ms
CiAJCQkgICAgIHN0cnVjdCBpYl9wZCAqcGQsIHN0cnVjdCBpYl91ZGF0YSAqdWRhdGEpOwogCWlu
dCAoKmRlcmVnX21yKShzdHJ1Y3QgaWJfbXIgKm1yLCBzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhKTsK
IAlzdHJ1Y3QgaWJfbXIgKigqYWxsb2NfbXIpKHN0cnVjdCBpYl9wZCAqcGQsIGVudW0gaWJfbXJf
dHlwZSBtcl90eXBlLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
