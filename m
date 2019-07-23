Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D0F71EF2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5376E33E;
	Tue, 23 Jul 2019 18:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C88789DBA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:36 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id v4so37046123qkj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bNeVrTrPvpjyJWHVtXYqgQlj6F1/0IzkZ0bc3aEFST0=;
 b=kGYMbLlxWhyU5R+0zILlX/Z5sNWLop+RHUwhPVGzejLmI5ZbmVEmKqTTSuBJ/pvFER
 jOWHEZHk+TpYwnrbcn+clDUF7IaTQxezG58PrG3xRJkU4g2/d2DXXI/Rmnmy45d6+/0i
 sNXeVQ05AmzLy22Z4dZSjHZqr1kyN0geH0lRpxDCeXjkrwBpq083lJyT+7kGd8IbJ+Xz
 M0G+tzH7p8x71X/J0swgCwhJ9i0eRGrqJ6jDYMJ4LkIFcbjZOknzlJl9HnNVG0kbxqUj
 1tmVKnMXsHQtAzcqOP7jB03p72aYMCsTFXP8MQUMhbpZ6DxbQCHqoDQYA/wTUwTHnoS9
 Ud+g==
X-Gm-Message-State: APjAAAUIpHRZ2q2YYc7hWVccLLjKZC5Z45I5xMhCOGxHEI8KKGc52XhI
 TTTeB9uqxTOTzydXnEWWXpXEeBFSYvu66p3m
X-Google-Smtp-Source: APXvYqyRt/sslYOExeWvOFH4KfKnKxW+V8w8qG436u1Li2H+fm4BIS46hHRf2O8j3VSTAztC1lSBD2N1vfHNfs72
X-Received: by 2002:a05:620a:522:: with SMTP id
 h2mr54247961qkh.329.1563904775319; 
 Tue, 23 Jul 2019 10:59:35 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:46 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <d684e1df08f2ecb6bc292e222b64fa9efbc26e69.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 09/15] drm/amdgpu: untag user pointers
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:19:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=bNeVrTrPvpjyJWHVtXYqgQlj6F1/0IzkZ0bc3aEFST0=;
 b=uWaCwrDkBN5GRSLhaw7WQwMKcK3AhPqO/fzElVN3JcPy98UFLj7JeXsg8P+SLlr/8N
 uTaOa6VggUuncDHcvq/dm+VjbWoXQVCEMVj3yqEv0lzhkp6ZqhxIJZIXWJox0QqwZPpw
 oblQlXNCYt4tHVrvlJypYdteLVvehIkVLfAlFHjgdjHvnPpCAD6GJOEurxmklM0IOqwa
 r3we5GB8/FJKwWzwzqUCJtO6E9+uXUbwxjMkihzlNrMKNzLhjZggf+0ZB/LMAafHfS91
 EJUlnCmBt8+isj3aFtdbAWI7Fy268Gzi52Ek2+IZaH/c0AJ5vAsChMY+9qCOx6dYD5bK
 14lw==
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
cwppdCBmb3Igdm1hIGxvb2t1cHMuCgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+ClN1Z2dlc3RlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5n
QGFtZC5jb20+CkFja2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICAgICAgICB8
IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmlu
ZGV4IDFkM2VlOWM0MmY3ZS4uMDA0NjhlYmY4Yjc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBAIC0xMTAzLDcgKzExMDMsNyBAQCBp
bnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAogCQlhbGxvY19mbGFn
cyA9IDA7CiAJCWlmICghb2Zmc2V0IHx8ICEqb2Zmc2V0KQogCQkJcmV0dXJuIC1FSU5WQUw7Ci0J
CXVzZXJfYWRkciA9ICpvZmZzZXQ7CisJCXVzZXJfYWRkciA9IHVudGFnZ2VkX2FkZHIoKm9mZnNl
dCk7CiAJfSBlbHNlIGlmIChmbGFncyAmIChBTExPQ19NRU1fRkxBR1NfRE9PUkJFTEwgfAogCQkJ
QUxMT0NfTUVNX0ZMQUdTX01NSU9fUkVNQVApKSB7CiAJCWRvbWFpbiA9IEFNREdQVV9HRU1fRE9N
QUlOX0dUVDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRleCA5Mzlm
ODMwNTUxMWIuLmQ3ODU1ODQyZmQ1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZW0uYwpAQCAtMjkxLDYgKzI5MSw4IEBAIGludCBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAl1aW50MzJfdCBoYW5kbGU7CiAJ
aW50IHI7CiAKKwlhcmdzLT5hZGRyID0gdW50YWdnZWRfYWRkcihhcmdzLT5hZGRyKTsKKwogCWlm
IChvZmZzZXRfaW5fcGFnZShhcmdzLT5hZGRyIHwgYXJncy0+c2l6ZSkpCiAJCXJldHVybiAtRUlO
VkFMOwogCi0tIAoyLjIyLjAuNzA5LmcxMDIzMDIxNDdiLWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
