Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187BB43399
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39236894E3;
	Thu, 13 Jun 2019 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FC78932D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:44:03 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id p193so4981618vkd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0pRrtQh1WGSItgbOKTKHJXYw3ig9cf9ovTOOwQBNCxo=;
 b=qYU9rUMA3ohI5dFqGilpDuKKX/QIOHk5h6IwM6KSM0c72DcX+S23imB70RUomvQcOc
 IPZc6sBWy8VEyG6k6sG2tnF0pi5EucQ2VFqYsv0FLTtjH0/SOnfHxNgXTzbYr96Ij5Mk
 oVDo4+owkK6uSC0++lE1RMpatZDOqWyxDHxPhePy2X8o2CT89x/yZOcWeZVJdO63yQzb
 4TdE69Itmdllu2S2m34tPMJjN6edH0SOPR6BQCyArWqG2BeVx9o4x5nFd8VB+wqz2fUu
 7uuTIkwIxNeNaQNRkSO2Df9FIMKe8evk0ZNE4yGkVXAafccb3wnHCKkjndE5AGyE8D3L
 XBHw==
X-Gm-Message-State: APjAAAXyBfuISRlhb6l2BomoI736IJWzy/Escf/2+f4fWrXOsbT9p5ME
 dHRv6qKxwo9FutSqZ6J4zT9V6a37EOYAF3+n
X-Google-Smtp-Source: APXvYqyhjQEo4g9YND5Fe8F9dcUypnQYf8jfozQHANwshchy+6+kG6ludLuigCmoO08U0FojfDlhn98Rsb9Khi5b
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr28666032uaf.95.1560339842024; 
 Wed, 12 Jun 2019 04:44:02 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:43:25 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <e2f35a0400150594a39d9c3f4b3088601fd5dc30.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 08/15] userfaultfd, arm64: untag user pointers
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
 bh=0pRrtQh1WGSItgbOKTKHJXYw3ig9cf9ovTOOwQBNCxo=;
 b=IoAMjSO8LpV9sQ4rhyGuwSi9qAWnWdJKm92qjIFlDfIzZK27lRdtbBpUTTqSsHKQqq
 mk4pY6s02uPltexkWHMnxfPS6E14WpHQTBtMuXD5ciPLmKwQYfFZ7D/irHKINjpULcIC
 qesPb2LJHGU1U+hg3Lnr8sbHR2PLa6XJRSA+MwutfJ1QD1fm8gchvdk4JFKcehQpLj7U
 rwlJqHzorntg7c/BDSuoHH78gq9KnzX7dlAs2pxjWc6C1dDkPCqTKTM+gMG73nj/ByrG
 HBTS6w/3UTjUct6MrDb5Sf2LP5/PYv9l52cM1MNahSes/06CDdeCzTIAFl18VFOFWLlP
 HuBg==
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
cmd1bWVudHMuCgp1c2VyZmF1bHRmZCBjb2RlIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZv
ciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB2YWxpZGF0ZV9yYW5nZSgpLgoKUmV2aWV3ZWQt
Ynk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+ClJldmlld2VkLWJ5
OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGZzL3VzZXJmYXVsdGZkLmMg
fCAyMiArKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvdXNlcmZhdWx0ZmQuYyBiL2Zz
L3VzZXJmYXVsdGZkLmMKaW5kZXggM2IzMDMwMWM5MGVjLi4yNGQ2OGMzYjVlZTIgMTAwNjQ0Ci0t
LSBhL2ZzL3VzZXJmYXVsdGZkLmMKKysrIGIvZnMvdXNlcmZhdWx0ZmQuYwpAQCAtMTI2MywyMSAr
MTI2MywyMyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgd2FrZV91c2VyZmF1bHQoc3Ry
dWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogfQogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGlu
dCB2YWxpZGF0ZV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKLQkJCQkJICBfX3U2NCBzdGFy
dCwgX191NjQgbGVuKQorCQkJCQkgIF9fdTY0ICpzdGFydCwgX191NjQgbGVuKQogewogCV9fdTY0
IHRhc2tfc2l6ZSA9IG1tLT50YXNrX3NpemU7CiAKLQlpZiAoc3RhcnQgJiB+UEFHRV9NQVNLKQor
CSpzdGFydCA9IHVudGFnZ2VkX2FkZHIoKnN0YXJ0KTsKKworCWlmICgqc3RhcnQgJiB+UEFHRV9N
QVNLKQogCQlyZXR1cm4gLUVJTlZBTDsKIAlpZiAobGVuICYgflBBR0VfTUFTSykKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJaWYgKCFsZW4pCiAJCXJldHVybiAtRUlOVkFMOwotCWlmIChzdGFydCA8IG1t
YXBfbWluX2FkZHIpCisJaWYgKCpzdGFydCA8IG1tYXBfbWluX2FkZHIpCiAJCXJldHVybiAtRUlO
VkFMOwotCWlmIChzdGFydCA+PSB0YXNrX3NpemUpCisJaWYgKCpzdGFydCA+PSB0YXNrX3NpemUp
CiAJCXJldHVybiAtRUlOVkFMOwotCWlmIChsZW4gPiB0YXNrX3NpemUgLSBzdGFydCkKKwlpZiAo
bGVuID4gdGFza19zaXplIC0gKnN0YXJ0KQogCQlyZXR1cm4gLUVJTlZBTDsKIAlyZXR1cm4gMDsK
IH0KQEAgLTEzMjcsNyArMTMyOSw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfcmVnaXN0ZXIo
c3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogCQlnb3RvIG91dDsKIAl9CiAKLQlyZXQgPSB2
YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0LAorCXJldCA9IHZh
bGlkYXRlX3JhbmdlKG1tLCAmdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0LAogCQkJICAgICB1
ZmZkaW9fcmVnaXN0ZXIucmFuZ2UubGVuKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKQEAgLTE1
MTYsNyArMTUxOCw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfdW5yZWdpc3RlcihzdHJ1Y3Qg
dXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiAJaWYgKGNvcHlfZnJvbV91c2VyKCZ1ZmZkaW9fdW5yZWdp
c3RlciwgYnVmLCBzaXplb2YodWZmZGlvX3VucmVnaXN0ZXIpKSkKIAkJZ290byBvdXQ7CiAKLQly
ZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3VucmVnaXN0ZXIuc3RhcnQsCisJcmV0ID0g
dmFsaWRhdGVfcmFuZ2UobW0sICZ1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwKIAkJCSAgICAgdWZm
ZGlvX3VucmVnaXN0ZXIubGVuKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKQEAgLTE2NjcsNyAr
MTY2OSw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfd2FrZShzdHJ1Y3QgdXNlcmZhdWx0ZmRf
Y3R4ICpjdHgsCiAJaWYgKGNvcHlfZnJvbV91c2VyKCZ1ZmZkaW9fd2FrZSwgYnVmLCBzaXplb2Yo
dWZmZGlvX3dha2UpKSkKIAkJZ290byBvdXQ7CiAKLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgt
Pm1tLCB1ZmZkaW9fd2FrZS5zdGFydCwgdWZmZGlvX3dha2UubGVuKTsKKwlyZXQgPSB2YWxpZGF0
ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX3dha2Uuc3RhcnQsIHVmZmRpb193YWtlLmxlbik7CiAJ
aWYgKHJldCkKIAkJZ290byBvdXQ7CiAKQEAgLTE3MDcsNyArMTcwOSw3IEBAIHN0YXRpYyBpbnQg
dXNlcmZhdWx0ZmRfY29weShzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiAJCQkgICBzaXpl
b2YodWZmZGlvX2NvcHkpLXNpemVvZihfX3M2NCkpKQogCQlnb3RvIG91dDsKIAotCXJldCA9IHZh
bGlkYXRlX3JhbmdlKGN0eC0+bW0sIHVmZmRpb19jb3B5LmRzdCwgdWZmZGlvX2NvcHkubGVuKTsK
KwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9f
Y29weS5sZW4pOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwogCS8qCkBAIC0xNzYzLDcgKzE3NjUs
NyBAQCBzdGF0aWMgaW50IHVzZXJmYXVsdGZkX3plcm9wYWdlKHN0cnVjdCB1c2VyZmF1bHRmZF9j
dHggKmN0eCwKIAkJCSAgIHNpemVvZih1ZmZkaW9femVyb3BhZ2UpLXNpemVvZihfX3M2NCkpKQog
CQlnb3RvIG91dDsKIAotCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sIHVmZmRpb196ZXJv
cGFnZS5yYW5nZS5zdGFydCwKKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlv
X3plcm9wYWdlLnJhbmdlLnN0YXJ0LAogCQkJICAgICB1ZmZkaW9femVyb3BhZ2UucmFuZ2UubGVu
KTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMy
LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
