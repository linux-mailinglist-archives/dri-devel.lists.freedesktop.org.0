Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81310105D8
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711398944A;
	Wed,  1 May 2019 07:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46181891D9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:24 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id i23so9103536pfa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=IkuD9zPPDPrNqKOg+1EuZo5HlTMskU88lY/hO73XGBQ=;
 b=hZ+Jq6//T5Pjrty9jwUNUoIoCS+Os6hUeVH9NfBkxQqmj51gpAb5qfuku43pZTLTaC
 7xr0mKHHd69WOtfGmYxdg0fyoV7s27mEcEp07Xd4t72rmwf/SQ77mQGT45hrz72Q6xiM
 WqVeqUAzice+9M48Lxj16bNExvTlD1OJMg4W3jSYAbtyMPppolIVAYigotpByXL4CQo8
 5MV8cKHdLBgRDA5TLcd2S+QzGYxH7GxZV6f6UJm6zbQdPsvnAfk3ry+3OrxtZbCieYv9
 /417eY9hIowRIncye17aRKm5UiU4l6LXTt22zqb2afYaMqx+YIDY1LsT3A3GJ+LaJ6x/
 D3wA==
X-Gm-Message-State: APjAAAVOkT0XDABTcEbmQW7XaHVDMIxT6aWs7gm7cpQD20UD89ucH354
 Tp30+QqBgkHXTuI+CEqBv4EkhlI3RBbo422B
X-Google-Smtp-Source: APXvYqxwzeO4aaEq5t7dlXsyLEMZLxNA1xUAM/PWlhFhSshLHzTvKlXrQBr9Il+4R5AJQuOw/QR46XMvR3q8fhhC
X-Received: by 2002:a65:534b:: with SMTP id w11mr7522791pgr.210.1556630723459; 
 Tue, 30 Apr 2019 06:25:23 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:24:58 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <29b7234f48a282037bdfc23e07ff167756fca0df.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 02/17] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Wed, 01 May 2019 07:18:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=IkuD9zPPDPrNqKOg+1EuZo5HlTMskU88lY/hO73XGBQ=;
 b=cjAZo1bevEgDG9f0Gp0lCqBUDVGf7WH9HfahHvPYK3yXKOMpkTJl6c0Qs/+BaViS4F
 SVbEHv0pbmF0M0fXn45Xz+XZ5NA51A6Q84gce81tqYq+4vQ4fSd4Vfr74XM9VMTqpEUn
 hpbIVHi0Y6E4lGzikQQHuG5LSWrNkshsuGLGjPRywGWJWT4PFmQUF2llhQi6ncC/Vlfh
 XyXZ2xzPVmh+mASSDoCOMBPHpUNh2v+x16jbihEdr4DI6v1V/jUL7ilAE/v54hqYIVN8
 AFB4b6bLnE3ptsM0NTOpxh1giv5Af/8Vei/jZ/b9XgJhABJa8DnBXyZnippbFF98erxD
 64TA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpjb3B5X2Zyb21fdXNlciAoYW5kIGEgZmV3IG90aGVyIHNpbWlsYXIgZnVuY3Rp
b25zKSBhcmUgdXNlZCB0byBjb3B5IGRhdGEKZnJvbSB1c2VyIG1lbW9yeSBpbnRvIHRoZSBrZXJu
ZWwgbWVtb3J5IG9yIHZpY2UgdmVyc2EuIFNpbmNlIGEgdXNlciBjYW4KcHJvdmlkZWQgYSB0YWdn
ZWQgcG9pbnRlciB0byBvbmUgb2YgdGhlIHN5c2NhbGxzIHRoYXQgdXNlIGNvcHlfZnJvbV91c2Vy
LAp3ZSBuZWVkIHRvIGNvcnJlY3RseSBoYW5kbGUgc3VjaCBwb2ludGVycy4KCkRvIHRoaXMgYnkg
dW50YWdnaW5nIHVzZXIgcG9pbnRlcnMgaW4gYWNjZXNzX29rIGFuZCBpbiBfX3VhY2Nlc3NfbWFz
a19wdHIsCmJlZm9yZSBwZXJmb3JtaW5nIGFjY2VzcyB2YWxpZGl0eSBjaGVja3MuCgpOb3RlLCB0
aGF0IHRoaXMgcGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBl
cmZvcm0gdGhlCmNoZWNrcywgYnV0IHRoZW4gcGFzc2VzIHRoZW0gYXMgaXMgaW50byB0aGUga2Vy
bmVsIGludGVybmFscy4KClJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZs
QGdvb2dsZS5jb20+Ci0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAxMCAr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5kZXggZTVkNWYzMWM2ZDM2Li45MTY0ZWNiNWZl
Y2EgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCisrKyBiL2Fy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCkBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZyBfX3JhbmdlX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1
bnNpZ25lZCBsb25nIHNpCiAJcmV0dXJuIHJldDsKIH0KIAotI2RlZmluZSBhY2Nlc3Nfb2soYWRk
ciwgc2l6ZSkJX19yYW5nZV9vayhhZGRyLCBzaXplKQorI2RlZmluZSBhY2Nlc3Nfb2soYWRkciwg
c2l6ZSkJX19yYW5nZV9vayh1bnRhZ2dlZF9hZGRyKGFkZHIpLCBzaXplKQogI2RlZmluZSB1c2Vy
X2FkZHJfbWF4CQkJZ2V0X2ZzCiAKICNkZWZpbmUgX0FTTV9FWFRBQkxFKGZyb20sIHRvKQkJCQkJ
CVwKQEAgLTIyNiw3ICsyMjYsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdWFjY2Vzc19lbmFibGVf
bm90X3Vhbyh2b2lkKQogCiAvKgogICogU2FuaXRpc2UgYSB1YWNjZXNzIHBvaW50ZXIgc3VjaCB0
aGF0IGl0IGJlY29tZXMgTlVMTCBpZiBhYm92ZSB0aGUKLSAqIGN1cnJlbnQgYWRkcl9saW1pdC4K
KyAqIGN1cnJlbnQgYWRkcl9saW1pdC4gSW4gY2FzZSB0aGUgcG9pbnRlciBpcyB0YWdnZWQgKGhh
cyB0aGUgdG9wIGJ5dGUgc2V0KSwKKyAqIHVudGFnIHRoZSBwb2ludGVyIGJlZm9yZSBjaGVja2lu
Zy4KICAqLwogI2RlZmluZSB1YWNjZXNzX21hc2tfcHRyKHB0cikgKF9fdHlwZW9mX18ocHRyKSlf
X3VhY2Nlc3NfbWFza19wdHIocHRyKQogc3RhdGljIGlubGluZSB2b2lkIF9fdXNlciAqX191YWNj
ZXNzX21hc2tfcHRyKGNvbnN0IHZvaWQgX191c2VyICpwdHIpCkBAIC0yMzQsMTAgKzIzNSwxMSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX191c2VyICpfX3VhY2Nlc3NfbWFza19wdHIoY29uc3Qgdm9p
ZCBfX3VzZXIgKnB0cikKIAl2b2lkIF9fdXNlciAqc2FmZV9wdHI7CiAKIAlhc20gdm9sYXRpbGUo
Ci0JIgliaWNzCXh6ciwgJTEsICUyXG4iCisJIgliaWNzCXh6ciwgJTMsICUyXG4iCiAJIgljc2Vs
CSUwLCAlMSwgeHpyLCBlcVxuIgogCTogIj0mciIgKHNhZmVfcHRyKQotCTogInIiIChwdHIpLCAi
ciIgKGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRkcl9saW1pdCkKKwk6ICJyIiAocHRyKSwgInIi
IChjdXJyZW50X3RocmVhZF9pbmZvKCktPmFkZHJfbGltaXQpLAorCSAgInIiICh1bnRhZ2dlZF9h
ZGRyKHB0cikpCiAJOiAiY2MiKTsKIAogCWNzZGIoKTsKLS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1
ZTE4LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
