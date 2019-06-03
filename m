Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7333FA6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CB189623;
	Tue,  4 Jun 2019 07:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2EF89024
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:53 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id b7so1004022qkk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=V8W9/R1INxLH8IpjzMBaweiOjVPk4ghaGGjHQk6nF0Q=;
 b=BQ8TF17wk5k9yYu8B09YWyHoCKlt2cCx9xWL4wgU+vywLXJEb6Yxypi/U3bjbTsh4k
 r3JR4XrUQpOeXlUjdA4DV0yhEctLywMOfi8sft83y6k9PWyWHv60QLrw8uOt1Ie28bz4
 hkZnM4uZOFONDU8Ql72TUK+aQnr1OmnTAuXS7hc07TiiKGjPd5HRnM6SdQN2VHdqUxpe
 Dqf25KCk0HMBNuP3WpjAcLESW3qOetsEoVws/tsqvBg4dv4aO8dvf2mBWl4xOaQzDJJM
 EvP1IPKq1UHNT1QoV8hVelyEQUI4FOVFfrQ1GaInF3zl9COibiQvLEZLtDSxKkZxLoAN
 EnQQ==
X-Gm-Message-State: APjAAAWEpAA8PCqi6Ujppb49d0C/PaN3S6JEhInwu1TajcwrunTe+eXz
 tuUxFotas03VT+PEzD9bHuRpOfmxFxe3AQSz
X-Google-Smtp-Source: APXvYqxbJDGUw94i6RNaa88fy33raOhr5MIqE66YRUj/nWlTewQjYqVQIrvYFblxs7ri2FDDMOtmRTjTXzyL1IBV
X-Received: by 2002:a37:6782:: with SMTP id b124mr6422877qkc.242.1559580953075; 
 Mon, 03 Jun 2019 09:55:53 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:11 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <7d6fef00d7daf647b5069101da8cf5a202da75b0.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 09/16] fs, arm64: untag user pointers in fs/userfaultfd.c
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
 bh=V8W9/R1INxLH8IpjzMBaweiOjVPk4ghaGGjHQk6nF0Q=;
 b=Ic80Nhco3iRVjaadOA8+znksGsevCWKjr0xS5FrfRT68EY2GjH7FNqxQ/S059IWRME
 Uk1bw3K6alaW8N/9Rs9bh2+EZh8EcVJH3cxi1ame2GYHVGzkN7Qz1H1smlWX23XCNo3x
 XPf9GSBwjp2Wlg5+Uj+WrIp+Jk7K9IWrhUgFda1FHXXV316C7cTRBKd5zQOn+A1+5Aft
 F1iszJDrA1FKS5eHvaL17A52p/3BNscmam9+VyXB7pU/EsAF/YnBaqcEkTUbGMZM4HOi
 O4Y2Ewn60j/2WNgR2OxufWSoY1qQbeSPNPwvgeO0aN1frIK5bxzhsw5VzJiPVQL++TeN
 2Fgw==
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
ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB2YWxpZGF0ZV9yYW5nZSgpLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGZzL3Vz
ZXJmYXVsdGZkLmMgfCAyMiArKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvdXNlcmZh
dWx0ZmQuYyBiL2ZzL3VzZXJmYXVsdGZkLmMKaW5kZXggM2IzMDMwMWM5MGVjLi4yNGQ2OGMzYjVl
ZTIgMTAwNjQ0Ci0tLSBhL2ZzL3VzZXJmYXVsdGZkLmMKKysrIGIvZnMvdXNlcmZhdWx0ZmQuYwpA
QCAtMTI2MywyMSArMTI2MywyMyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgd2FrZV91
c2VyZmF1bHQoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogfQogCiBzdGF0aWMgX19hbHdh
eXNfaW5saW5lIGludCB2YWxpZGF0ZV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKLQkJCQkJ
ICBfX3U2NCBzdGFydCwgX191NjQgbGVuKQorCQkJCQkgIF9fdTY0ICpzdGFydCwgX191NjQgbGVu
KQogewogCV9fdTY0IHRhc2tfc2l6ZSA9IG1tLT50YXNrX3NpemU7CiAKLQlpZiAoc3RhcnQgJiB+
UEFHRV9NQVNLKQorCSpzdGFydCA9IHVudGFnZ2VkX2FkZHIoKnN0YXJ0KTsKKworCWlmICgqc3Rh
cnQgJiB+UEFHRV9NQVNLKQogCQlyZXR1cm4gLUVJTlZBTDsKIAlpZiAobGVuICYgflBBR0VfTUFT
SykKIAkJcmV0dXJuIC1FSU5WQUw7CiAJaWYgKCFsZW4pCiAJCXJldHVybiAtRUlOVkFMOwotCWlm
IChzdGFydCA8IG1tYXBfbWluX2FkZHIpCisJaWYgKCpzdGFydCA8IG1tYXBfbWluX2FkZHIpCiAJ
CXJldHVybiAtRUlOVkFMOwotCWlmIChzdGFydCA+PSB0YXNrX3NpemUpCisJaWYgKCpzdGFydCA+
PSB0YXNrX3NpemUpCiAJCXJldHVybiAtRUlOVkFMOwotCWlmIChsZW4gPiB0YXNrX3NpemUgLSBz
dGFydCkKKwlpZiAobGVuID4gdGFza19zaXplIC0gKnN0YXJ0KQogCQlyZXR1cm4gLUVJTlZBTDsK
IAlyZXR1cm4gMDsKIH0KQEAgLTEzMjcsNyArMTMyOSw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0
ZmRfcmVnaXN0ZXIoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogCQlnb3RvIG91dDsKIAl9
CiAKLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0
LAorCXJldCA9IHZhbGlkYXRlX3JhbmdlKG1tLCAmdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0
LAogCQkJICAgICB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2UubGVuKTsKIAlpZiAocmV0KQogCQlnb3Rv
IG91dDsKQEAgLTE1MTYsNyArMTUxOCw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfdW5yZWdp
c3RlcihzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiAJaWYgKGNvcHlfZnJvbV91c2VyKCZ1
ZmZkaW9fdW5yZWdpc3RlciwgYnVmLCBzaXplb2YodWZmZGlvX3VucmVnaXN0ZXIpKSkKIAkJZ290
byBvdXQ7CiAKLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3VucmVnaXN0ZXIuc3Rh
cnQsCisJcmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sICZ1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwK
IAkJCSAgICAgdWZmZGlvX3VucmVnaXN0ZXIubGVuKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsK
QEAgLTE2NjcsNyArMTY2OSw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfd2FrZShzdHJ1Y3Qg
dXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiAJaWYgKGNvcHlfZnJvbV91c2VyKCZ1ZmZkaW9fd2FrZSwg
YnVmLCBzaXplb2YodWZmZGlvX3dha2UpKSkKIAkJZ290byBvdXQ7CiAKLQlyZXQgPSB2YWxpZGF0
ZV9yYW5nZShjdHgtPm1tLCB1ZmZkaW9fd2FrZS5zdGFydCwgdWZmZGlvX3dha2UubGVuKTsKKwly
ZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX3dha2Uuc3RhcnQsIHVmZmRpb193
YWtlLmxlbik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKQEAgLTE3MDcsNyArMTcwOSw3IEBA
IHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfY29weShzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgs
CiAJCQkgICBzaXplb2YodWZmZGlvX2NvcHkpLXNpemVvZihfX3M2NCkpKQogCQlnb3RvIG91dDsK
IAotCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sIHVmZmRpb19jb3B5LmRzdCwgdWZmZGlv
X2NvcHkubGVuKTsKKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX2NvcHku
ZHN0LCB1ZmZkaW9fY29weS5sZW4pOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwogCS8qCkBAIC0x
NzYzLDcgKzE3NjUsNyBAQCBzdGF0aWMgaW50IHVzZXJmYXVsdGZkX3plcm9wYWdlKHN0cnVjdCB1
c2VyZmF1bHRmZF9jdHggKmN0eCwKIAkJCSAgIHNpemVvZih1ZmZkaW9femVyb3BhZ2UpLXNpemVv
ZihfX3M2NCkpKQogCQlnb3RvIG91dDsKIAotCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0s
IHVmZmRpb196ZXJvcGFnZS5yYW5nZS5zdGFydCwKKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgt
Pm1tLCAmdWZmZGlvX3plcm9wYWdlLnJhbmdlLnN0YXJ0LAogCQkJICAgICB1ZmZkaW9femVyb3Bh
Z2UucmFuZ2UubGVuKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKLS0gCjIuMjIuMC5yYzEuMzEx
Lmc1ZDc1NzNhMTUxLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
