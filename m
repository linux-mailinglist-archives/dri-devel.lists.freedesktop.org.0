Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF133FA7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6453896F7;
	Tue,  4 Jun 2019 07:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A99289160
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:40 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id o1so14705428ybk.17
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ai2S3fD+fr3rvCBmSGFiSuVAfjaa7sExxiTSFFYH1Fc=;
 b=e30/VcasTSGI8Ydle8COG4mgWvXvyCZkaGZI3QlhJM0d6MaPrEHdPOz9qtt/AwYBpe
 f8DwB8TtGiQHzNJ5EoHwISicP9X3K56g1/ajnbzXNsTasjobiv+fZaO3I8hVHTw2FH0p
 bx7yd6EbHHUxNp59HQ0xj7pa6vYO435Fe5Cy706KEa2oezRlRMi+leMjvY9F7OT3pLZU
 Wf0JkrWyVqIen9EFreMVmU09qVGL5PkpP4qlpXn/uv592E+85LyV8PR/VmpNcHZZWkps
 /X0G/tbtiT/XXZJKE2MgtKCH7MYwkkhvnvRhPuY5tDraP4CYT0ZnioEzn3rASQjd4oGE
 7PWQ==
X-Gm-Message-State: APjAAAX6M6ZvBiRrpyBAi19BfqdaytEWt7NgF/cEVXlb0AIAb5Jzbdg6
 GXUz+/ihF6j20gLohQRiWB+vl1hPwmJGdsqM
X-Google-Smtp-Source: APXvYqyU8lBI93nJuhlJYUnIY7lf1oCA3Bdyf6XCo68IA8G3gKcVv3P8yXxzoFzeAZRqfZIBiTZMwuBdZZXNUsQZ
X-Received: by 2002:a25:bfcf:: with SMTP id q15mr11764130ybm.453.1559580939725; 
 Mon, 03 Jun 2019 09:55:39 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:07 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 05/16] arm64: untag user pointers passed to memory syscalls
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
 bh=ai2S3fD+fr3rvCBmSGFiSuVAfjaa7sExxiTSFFYH1Fc=;
 b=IhwpzfJqwE3DvUc/g2ohuoF7FRDSV+OKLdbdm3aHJhyQC5R8qffzGm3GUGDEK5mLGU
 HwRFraAw3ADQD0MAJJ3addDW9VF2xcSR/1cU+MqYWb30fZYz6OI+lqi9l0mvrBzJRKlx
 9Jf/vJ7t9tP8BgDAD/yBWpZTteEGqZVu6BQfOgaOZ55GquSpR/7KRV6XVaghO9dlfSJI
 nnlViXK79lK70wRQBUW327/n/PMH7XujjWiQLfV9EFwKMzG6uOgMIpIPl3C2s4DgbvSu
 MCtmUckwctT1sQWlCUv7u3dxJmI+R7ltNLatQs+ATRBm1UQXWv9Bi0Pz/MXuzZkI0IoN
 5eSw==
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
cmd1bWVudHMuCgpUaGlzIHBhdGNoIGFsbG93cyB0YWdnZWQgcG9pbnRlcnMgdG8gYmUgcGFzc2Vk
IHRvIHRoZSBmb2xsb3dpbmcgbWVtb3J5CnN5c2NhbGxzOiBnZXRfbWVtcG9saWN5LCBtYWR2aXNl
LCBtYmluZCwgbWluY29yZSwgbWxvY2ssIG1sb2NrMiwgbXByb3RlY3QsCm1yZW1hcCwgbXN5bmMs
IG11bmxvY2suCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdv
b2dsZS5jb20+Ci0tLQogbW0vbWFkdmlzZS5jICAgfCAyICsrCiBtbS9tZW1wb2xpY3kuYyB8IDMg
KysrCiBtbS9taW5jb3JlLmMgICB8IDIgKysKIG1tL21sb2NrLmMgICAgIHwgNCArKysrCiBtbS9t
cHJvdGVjdC5jICB8IDIgKysKIG1tL21yZW1hcC5jICAgIHwgMiArKwogbW0vbXN5bmMuYyAgICAg
fCAyICsrCiA3IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9t
bS9tYWR2aXNlLmMgYi9tbS9tYWR2aXNlLmMKaW5kZXggNjI4MDIyZTY3NGE3Li4zOWI4MmY4YTY5
OGYgMTAwNjQ0Ci0tLSBhL21tL21hZHZpc2UuYworKysgYi9tbS9tYWR2aXNlLmMKQEAgLTgxMCw2
ICs4MTAsOCBAQCBTWVNDQUxMX0RFRklORTMobWFkdmlzZSwgdW5zaWduZWQgbG9uZywgc3RhcnQs
IHNpemVfdCwgbGVuX2luLCBpbnQsIGJlaGF2aW9yKQogCXNpemVfdCBsZW47CiAJc3RydWN0IGJs
a19wbHVnIHBsdWc7CiAKKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOworCiAJaWYgKCFt
YWR2aXNlX2JlaGF2aW9yX3ZhbGlkKGJlaGF2aW9yKSkKIAkJcmV0dXJuIGVycm9yOwogCmRpZmYg
LS1naXQgYS9tbS9tZW1wb2xpY3kuYyBiL21tL21lbXBvbGljeS5jCmluZGV4IDAxNjAwZDgwYWUw
MS4uNzhlMGE4OGIyNjgwIDEwMDY0NAotLS0gYS9tbS9tZW1wb2xpY3kuYworKysgYi9tbS9tZW1w
b2xpY3kuYwpAQCAtMTM2MCw2ICsxMzYwLDcgQEAgc3RhdGljIGxvbmcga2VybmVsX21iaW5kKHVu
c2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgbGVuLAogCWludCBlcnI7CiAJdW5zaWdu
ZWQgc2hvcnQgbW9kZV9mbGFnczsKIAorCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7CiAJ
bW9kZV9mbGFncyA9IG1vZGUgJiBNUE9MX01PREVfRkxBR1M7CiAJbW9kZSAmPSB+TVBPTF9NT0RF
X0ZMQUdTOwogCWlmIChtb2RlID49IE1QT0xfTUFYKQpAQCAtMTUxNyw2ICsxNTE4LDggQEAgc3Rh
dGljIGludCBrZXJuZWxfZ2V0X21lbXBvbGljeShpbnQgX191c2VyICpwb2xpY3ksCiAJaW50IHVu
aW5pdGlhbGl6ZWRfdmFyKHB2YWwpOwogCW5vZGVtYXNrX3Qgbm9kZXM7CiAKKwlhZGRyID0gdW50
YWdnZWRfYWRkcihhZGRyKTsKKwogCWlmIChubWFzayAhPSBOVUxMICYmIG1heG5vZGUgPCBucl9u
b2RlX2lkcykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKZGlmZiAtLWdpdCBhL21tL21pbmNvcmUuYyBi
L21tL21pbmNvcmUuYwppbmRleCBjM2YwNThiZDBmYWYuLjY0YzMyMmVkODQ1YyAxMDA2NDQKLS0t
IGEvbW0vbWluY29yZS5jCisrKyBiL21tL21pbmNvcmUuYwpAQCAtMjQ5LDYgKzI0OSw4IEBAIFNZ
U0NBTExfREVGSU5FMyhtaW5jb3JlLCB1bnNpZ25lZCBsb25nLCBzdGFydCwgc2l6ZV90LCBsZW4s
CiAJdW5zaWduZWQgbG9uZyBwYWdlczsKIAl1bnNpZ25lZCBjaGFyICp0bXA7CiAKKwlzdGFydCA9
IHVudGFnZ2VkX2FkZHIoc3RhcnQpOworCiAJLyogQ2hlY2sgdGhlIHN0YXJ0IGFkZHJlc3M6IG5l
ZWRzIHRvIGJlIHBhZ2UtYWxpZ25lZC4uICovCiAJaWYgKHN0YXJ0ICYgflBBR0VfTUFTSykKIAkJ
cmV0dXJuIC1FSU5WQUw7CmRpZmYgLS1naXQgYS9tbS9tbG9jay5jIGIvbW0vbWxvY2suYwppbmRl
eCAwODBmM2IzNjQxNWIuLmU4MjYwOWVhYTQyOCAxMDA2NDQKLS0tIGEvbW0vbWxvY2suYworKysg
Yi9tbS9tbG9jay5jCkBAIC02NzQsNiArNjc0LDggQEAgc3RhdGljIF9fbXVzdF9jaGVjayBpbnQg
ZG9fbWxvY2sodW5zaWduZWQgbG9uZyBzdGFydCwgc2l6ZV90IGxlbiwgdm1fZmxhZ3NfdCBmbGEK
IAl1bnNpZ25lZCBsb25nIGxvY2tfbGltaXQ7CiAJaW50IGVycm9yID0gLUVOT01FTTsKIAorCXN0
YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7CisKIAlpZiAoIWNhbl9kb19tbG9jaygpKQogCQly
ZXR1cm4gLUVQRVJNOwogCkBAIC03MzUsNiArNzM3LDggQEAgU1lTQ0FMTF9ERUZJTkUyKG11bmxv
Y2ssIHVuc2lnbmVkIGxvbmcsIHN0YXJ0LCBzaXplX3QsIGxlbikKIHsKIAlpbnQgcmV0OwogCisJ
c3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKKwogCWxlbiA9IFBBR0VfQUxJR04obGVuICsg
KG9mZnNldF9pbl9wYWdlKHN0YXJ0KSkpOwogCXN0YXJ0ICY9IFBBR0VfTUFTSzsKIApkaWZmIC0t
Z2l0IGEvbW0vbXByb3RlY3QuYyBiL21tL21wcm90ZWN0LmMKaW5kZXggYmYzOGRmYmJiNGI0Li4x
OWY5ODFiNzMzYmMgMTAwNjQ0Ci0tLSBhL21tL21wcm90ZWN0LmMKKysrIGIvbW0vbXByb3RlY3Qu
YwpAQCAtNDY1LDYgKzQ2NSw4IEBAIHN0YXRpYyBpbnQgZG9fbXByb3RlY3RfcGtleSh1bnNpZ25l
ZCBsb25nIHN0YXJ0LCBzaXplX3QgbGVuLAogCWNvbnN0IGJvb2wgcmllciA9IChjdXJyZW50LT5w
ZXJzb25hbGl0eSAmIFJFQURfSU1QTElFU19FWEVDKSAmJgogCQkJCShwcm90ICYgUFJPVF9SRUFE
KTsKIAorCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7CisKIAlwcm90ICY9IH4oUFJPVF9H
Uk9XU0RPV058UFJPVF9HUk9XU1VQKTsKIAlpZiAoZ3Jvd3MgPT0gKFBST1RfR1JPV1NET1dOfFBS
T1RfR1JPV1NVUCkpIC8qIGNhbid0IGJlIGJvdGggKi8KIAkJcmV0dXJuIC1FSU5WQUw7CmRpZmYg
LS1naXQgYS9tbS9tcmVtYXAuYyBiL21tL21yZW1hcC5jCmluZGV4IGZjMjQxZDIzY2Q5Ny4uMWQ5
ODI4MWY3MjA0IDEwMDY0NAotLS0gYS9tbS9tcmVtYXAuYworKysgYi9tbS9tcmVtYXAuYwpAQCAt
NjA2LDYgKzYwNiw4IEBAIFNZU0NBTExfREVGSU5FNShtcmVtYXAsIHVuc2lnbmVkIGxvbmcsIGFk
ZHIsIHVuc2lnbmVkIGxvbmcsIG9sZF9sZW4sCiAJTElTVF9IRUFEKHVmX3VubWFwX2Vhcmx5KTsK
IAlMSVNUX0hFQUQodWZfdW5tYXApOwogCisJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7CisK
IAlpZiAoZmxhZ3MgJiB+KE1SRU1BUF9GSVhFRCB8IE1SRU1BUF9NQVlNT1ZFKSkKIAkJcmV0dXJu
IHJldDsKIApkaWZmIC0tZ2l0IGEvbW0vbXN5bmMuYyBiL21tL21zeW5jLmMKaW5kZXggZWYzMGE0
Mjk2MjNhLi5jM2JkM2U3NWY2ODcgMTAwNjQ0Ci0tLSBhL21tL21zeW5jLmMKKysrIGIvbW0vbXN5
bmMuYwpAQCAtMzcsNiArMzcsOCBAQCBTWVNDQUxMX0RFRklORTMobXN5bmMsIHVuc2lnbmVkIGxv
bmcsIHN0YXJ0LCBzaXplX3QsIGxlbiwgaW50LCBmbGFncykKIAlpbnQgdW5tYXBwZWRfZXJyb3Ig
PSAwOwogCWludCBlcnJvciA9IC1FSU5WQUw7CiAKKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3Rh
cnQpOworCiAJaWYgKGZsYWdzICYgfihNU19BU1lOQyB8IE1TX0lOVkFMSURBVEUgfCBNU19TWU5D
KSkKIAkJZ290byBvdXQ7CiAJaWYgKG9mZnNldF9pbl9wYWdlKHN0YXJ0KSkKLS0gCjIuMjIuMC5y
YzEuMzExLmc1ZDc1NzNhMTUxLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
