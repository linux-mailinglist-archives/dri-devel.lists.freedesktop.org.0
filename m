Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB933FB7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABE48966B;
	Tue,  4 Jun 2019 07:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5389024
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:57 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id u129so975792qkd.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QTQ4ZZ+1ONHvx3iNcSe/c62gqBzIbuX20WtdiRnopfw=;
 b=UyHY22gWEgWA8oO4+Axi4kEQUFghewjReIr+qP+U5PI9xzfxiaTEdFT8Ho+ELO5BL4
 9qm5GsyJS6E+DPt4X5xu7w8+cF9I5KIYu58HcilnIuX+TioTTlmgMWs4+KtSNLXwZIRF
 CXvxsjONZy0R2l2VWmyotwfS93kSdfIFyY9OREMeXEdfGwrA3EZT2vQn/63iycMRpi+U
 f8RuT0waJZZ0IW+pdWt0TawhBD3RKfcVLyjqwf2Afti0LWRQ6AbpL0gOi55FF7WcZplo
 003VuTKlUBgJifjxFOacjyc5upUBThKE3eOnFshni1DcOhfCWMKv1H1ETRkSt7rBVxAC
 ezyg==
X-Gm-Message-State: APjAAAVGPT6mmi8YzwJX2B9SeqQrv72q5LbfK80qz/cBlu3EsCHlxtx+
 Fu2TgCPQMiqDN/VSCQscjHF1HhsVvEL3ANeq
X-Google-Smtp-Source: APXvYqynCi8uC9mwY5hf72ttWfEiYBsQ+6wl0nvKi3Uj+AQb+Ufw5GSOsuV9qYkE0ai47XUYEZWA+IZ0Az+FoQAg
X-Received: by 2002:a37:8002:: with SMTP id b2mr23304828qkd.289.1559580956267; 
 Mon, 03 Jun 2019 09:55:56 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:12 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <47d4e95b61013933ffe4f0be8832d03179d94b27.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 10/16] drm/amdgpu, arm64: untag user pointers
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
 bh=QTQ4ZZ+1ONHvx3iNcSe/c62gqBzIbuX20WtdiRnopfw=;
 b=Iulw2LDXuMXrguiNT2nc8pImmlAd9SEaHxzy+PIXZoC7Ry1861+IgSJT7msXK0lxjW
 Stlg9JACJI0q7DDqW7dFD1lXLlRa2BWigOxwo5Vw8cFe6qNirKkII0FhPNgtUk9+cp1T
 aHJGoLoDr4Q8979Fk7TFLPwhp9/TzWuYwglUurKj3rFU9GpRJ5xL6D7/jxXgMSu4llum
 hXs/FNVkTTazIDAfHhBMirRaAiVUM4CzdwvnR1yvQzgHmFdNai1A63k4wvi7etXyFGuo
 QDD/dhSJypo/bxB/7BkdNMWk1BD1fsQcPpD2mwu3O8zxH9SkplM6OKzkYqDvbWZfOgAq
 9GzA==
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
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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
Y2ggdXNlcwppdCBmb3Igdm1hIGxvb2t1cHMuCgpTdWdnZXN0ZWQtYnk6IEt1ZWhsaW5nLCBGZWxp
eCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9ncHV2bS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jICAgICAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dwdXZtLmMKaW5kZXggYTZlNTE4NGQ0MzZjLi41ZDQ3NmU5YmJjNDMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTEx
MDgsNyArMTEwOCw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9n
cHUoCiAJCWFsbG9jX2ZsYWdzID0gMDsKIAkJaWYgKCFvZmZzZXQgfHwgISpvZmZzZXQpCiAJCQly
ZXR1cm4gLUVJTlZBTDsKLQkJdXNlcl9hZGRyID0gKm9mZnNldDsKKwkJdXNlcl9hZGRyID0gdW50
YWdnZWRfYWRkcigqb2Zmc2V0KTsKIAl9IGVsc2UgaWYgKGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdT
X0RPT1JCRUxMKSB7CiAJCWRvbWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsKIAkJYWxsb2Nf
ZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fQ1BVOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dlbS5jCmluZGV4IGQ0ZmNmNTQ3NTQ2NC4uZTkxZGYxNDA3NjE4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCkBAIC0yODcsNiArMjg3LDggQEAgaW50IGFt
ZGdwdV9nZW1fdXNlcnB0cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRh
LAogCXVpbnQzMl90IGhhbmRsZTsKIAlpbnQgcjsKIAorCWFyZ3MtPmFkZHIgPSB1bnRhZ2dlZF9h
ZGRyKGFyZ3MtPmFkZHIpOworCiAJaWYgKG9mZnNldF9pbl9wYWdlKGFyZ3MtPmFkZHIgfCBhcmdz
LT5zaXplKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuMjIuMC5yYzEuMzExLmc1ZDc1NzNh
MTUxLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
