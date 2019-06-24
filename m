Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4A52467
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8FD89F77;
	Tue, 25 Jun 2019 07:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF9789B69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:08 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id v126so1553422vkv.20
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OFC24w2VYFjptSxPqCpbBEqhaUlc2rZ4vtg/DxWHKUY=;
 b=gqmU0ZqdEGLWQ82LgW8LkVD9s7A/OcAy2kiDMNaBGq+kT9wWjmUkF7Zz+WamQUE+6L
 bYJW0baYXEjFhQSyp/pFakjo0wTOx3c9pqQIp+hcKch2LcicwjxT28zCPZWuzqDlZxfN
 oeW2CLE6DB/MHrh4C3sOHaMH0mnbUjsK0o8e5zHpJBWQXmWBnbRxAAdGC7jJNbwlhDUn
 PKBG2pD/PNQhoqWsJE/Jly8dxbfTi6XyLnBydQVtAcMwfc/kSAF8sd900MZMo2VaWVcA
 q0pq2Uyww/eqqWPu4lw0gVySQgmgpesUshWQ3Iqm+3vzOceyygSfc/yoV+VcpzkRgA0W
 iFxg==
X-Gm-Message-State: APjAAAVQgH+xE7eBYcGKx3dFjoK0vRMro/RqgPeC3bQIJzhd+niH6NSP
 m4dTXnAKlhpIBjWiM6AnjfWafagfddUJjQew
X-Google-Smtp-Source: APXvYqztHTWRHYOC83H4IfNbENBsJMJpCmuVpe91PkFE56CWhu5KbIzw0hmUvviWu8/4yX8wEpc7iI+Lm7IC+LHT
X-Received: by 2002:a67:6e44:: with SMTP id j65mr66559877vsc.132.1561386787480; 
 Mon, 24 Jun 2019 07:33:07 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:32:46 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <98cbd89549395d372a4a20ab2ac536bf19d37e52.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 01/15] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
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
 bh=OFC24w2VYFjptSxPqCpbBEqhaUlc2rZ4vtg/DxWHKUY=;
 b=daRRCGEXfLHGLUQo//HRDLfqaBO4lfL42FrfPGRnRKOhn1XL6qGzvLE8amzWfXer5a
 WhALrZBTuSnnuN10/CaZpZqQ5oMU4MQefeNJm/AP0b4uEXgK32RunU93durvNp8XKKHL
 uQfK0a3nA5oC/DUYeVxUqLVQFd9uJpb2OtV7FV9mAWqDzJacQiBSNlyVGMSQHbzkOff3
 MC+xIW6PfIq1tVQloxoUTZ3GncOdewoLB+fLV/jb+kaJgM+7s5iRXhY273LkR2goOH7a
 Ap1pVnJAk4onxG8CZjucr85/ku+lb+LecGyuZhueMHSpk8X8CCgAIxuGrhQgzxcP8FnL
 C2Sw==
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
dHMuCgpjb3B5X2Zyb21fdXNlciAoYW5kIGEgZmV3IG90aGVyIHNpbWlsYXIgZnVuY3Rpb25zKSBh
cmUgdXNlZCB0byBjb3B5IGRhdGEKZnJvbSB1c2VyIG1lbW9yeSBpbnRvIHRoZSBrZXJuZWwgbWVt
b3J5IG9yIHZpY2UgdmVyc2EuIFNpbmNlIGEgdXNlciBjYW4KcHJvdmlkZWQgYSB0YWdnZWQgcG9p
bnRlciB0byBvbmUgb2YgdGhlIHN5c2NhbGxzIHRoYXQgdXNlIGNvcHlfZnJvbV91c2VyLAp3ZSBu
ZWVkIHRvIGNvcnJlY3RseSBoYW5kbGUgc3VjaCBwb2ludGVycy4KCkRvIHRoaXMgYnkgdW50YWdn
aW5nIHVzZXIgcG9pbnRlcnMgaW4gYWNjZXNzX29rIGFuZCBpbiBfX3VhY2Nlc3NfbWFza19wdHIs
CmJlZm9yZSBwZXJmb3JtaW5nIGFjY2VzcyB2YWxpZGl0eSBjaGVja3MuCgpOb3RlLCB0aGF0IHRo
aXMgcGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0g
dGhlCmNoZWNrcywgYnV0IHRoZW4gcGFzc2VzIHRoZW0gYXMgaXMgaW50byB0aGUga2VybmVsIGlu
dGVybmFscy4KClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8dmluY2Vuem8uZnJhc2Np
bm9AYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3Jn
PgpSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4K
U2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgot
LS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMTAgKysrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oCmluZGV4IDVhMWMzMjI2MGMxZi4uYTEzOGUzYjRmNzE3IDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaApAQCAtNjIsNiArNjIsOCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGxvbmcgX19yYW5nZV9vayhjb25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBz
aQogewogCXVuc2lnbmVkIGxvbmcgcmV0LCBsaW1pdCA9IGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+
YWRkcl9saW1pdDsKIAorCWFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFkZHIpOworCiAJX19jaGtfdXNl
cl9wdHIoYWRkcik7CiAJYXNtIHZvbGF0aWxlKAogCS8vIEEgKyBCIDw9IEMgKyAxIGZvciBhbGwg
QSxCLEMsIGluIGZvdXIgZWFzeSBzdGVwczoKQEAgLTIxNSw3ICsyMTcsOCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgdWFjY2Vzc19lbmFibGVfbm90X3Vhbyh2b2lkKQogCiAvKgogICogU2FuaXRpc2Ug
YSB1YWNjZXNzIHBvaW50ZXIgc3VjaCB0aGF0IGl0IGJlY29tZXMgTlVMTCBpZiBhYm92ZSB0aGUK
LSAqIGN1cnJlbnQgYWRkcl9saW1pdC4KKyAqIGN1cnJlbnQgYWRkcl9saW1pdC4gSW4gY2FzZSB0
aGUgcG9pbnRlciBpcyB0YWdnZWQgKGhhcyB0aGUgdG9wIGJ5dGUgc2V0KSwKKyAqIHVudGFnIHRo
ZSBwb2ludGVyIGJlZm9yZSBjaGVja2luZy4KICAqLwogI2RlZmluZSB1YWNjZXNzX21hc2tfcHRy
KHB0cikgKF9fdHlwZW9mX18ocHRyKSlfX3VhY2Nlc3NfbWFza19wdHIocHRyKQogc3RhdGljIGlu
bGluZSB2b2lkIF9fdXNlciAqX191YWNjZXNzX21hc2tfcHRyKGNvbnN0IHZvaWQgX191c2VyICpw
dHIpCkBAIC0yMjMsMTAgKzIyNiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX191c2VyICpfX3Vh
Y2Nlc3NfbWFza19wdHIoY29uc3Qgdm9pZCBfX3VzZXIgKnB0cikKIAl2b2lkIF9fdXNlciAqc2Fm
ZV9wdHI7CiAKIAlhc20gdm9sYXRpbGUoCi0JIgliaWNzCXh6ciwgJTEsICUyXG4iCisJIgliaWNz
CXh6ciwgJTMsICUyXG4iCiAJIgljc2VsCSUwLCAlMSwgeHpyLCBlcVxuIgogCTogIj0mciIgKHNh
ZmVfcHRyKQotCTogInIiIChwdHIpLCAiciIgKGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRkcl9s
aW1pdCkKKwk6ICJyIiAocHRyKSwgInIiIChjdXJyZW50X3RocmVhZF9pbmZvKCktPmFkZHJfbGlt
aXQpLAorCSAgInIiICh1bnRhZ2dlZF9hZGRyKHB0cikpCiAJOiAiY2MiKTsKIAogCWNzZGIoKTsK
LS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
