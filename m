Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19D15E25
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F2F89DD2;
	Tue,  7 May 2019 07:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED91689AB6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:31:44 +0000 (UTC)
Received: by mail-oi1-x24a.google.com with SMTP id q82so4534430oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=eYbhxmTmdaiTVlq2aRmj2n9QkL6CX4/S4opJ9oDHFhE=;
 b=n7aod+HSHpn4jUXd0USLBnIAXe6/cDePJagkSHrd2n9ljELNL0sDwOTyb6C7ITWJPu
 76fXJluEOTTgBEkEZun8HjHdniTeQ7zRd0DbeWbM4hP+ZyaLnDeYMRnfw4qBdElTq8Qs
 y/Jxd2x8jRi63LftqDSC9ND8vejBwmtze5S4ha8E/m/qP6kTGXiBt41eb2tscOLrv65y
 JbNM44r7QJbo+7gpN0fNRbuQDbDUNphTsfLUaw7X3r6nHaTFv4zXsLuwJQHP1XYgFcQ7
 nAnBbxWeHOtr0oaI+TQEb3EMnH2aNspsBBhxh8ITnhq9EzjBFIoRPEkQjQSwG2j5sOs2
 gK7g==
X-Gm-Message-State: APjAAAUaIHEfnN+8J2ji7umjraF0tdLPrvQohxzUtXkW7PobYwS5vgXI
 GCeh39LIScoOPAhJv3FkMrnJFudTPdRZaTXF
X-Google-Smtp-Source: APXvYqzdzQlfaHkw0Qwo4QQtxGeWhxSSS13Ps1SOtj6ReWwWjESZwRkhi/LnnldOgTKgizVRLfncWXFiUgbgbiQx
X-Received: by 2002:a9d:7d04:: with SMTP id v4mr16958653otn.185.1557160304159; 
 Mon, 06 May 2019 09:31:44 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:58 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <03fe9d923db75cf72678f3ce103838e67390751a.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 12/17] drm/radeon,
 arm64: untag user pointers in radeon_gem_userptr_ioctl
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=eYbhxmTmdaiTVlq2aRmj2n9QkL6CX4/S4opJ9oDHFhE=;
 b=ZSFHbQPvMQhkrf29+rXmES4x80rxWQfO3CRg3EirSkEvMHaN6TChbsHuGqG8tqYPqI
 EOCA65HA1vwG2VBAq4EN+A4OM16jXXWhM8t5gUCVAGxaFpj7A96cWjckSSXVB9ifgUBP
 JPRXtbLz3WvjXz6TEKimgkTZH4CSKnvPcLkcG+UwjiKkw5OJqJ0dywa/iWl3MUEMoYLx
 yX/R0TAlH28V7Dy/lDpZ2CQKiEy+5rLrSQMyM1Z1SBWcw4VX+lOfzjflOLQGIDoNcKIy
 Lw+nu7cdx5CVE6SIyoKDCFcQFHBzYbom0atBI7FulTuqD2oMzEvZRTJLiB0pdkfBeBX2
 irnA==
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
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpJbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbiBNTVUgbm90aWZpZXIg
aXMgc2V0IHVwIHdpdGggYSAodGFnZ2VkKQp1c2Vyc3BhY2UgcG9pbnRlci4gVGhlIHVudGFnZ2Vk
IGFkZHJlc3Mgc2hvdWxkIGJlIHVzZWQgc28gdGhhdCBNTVUKbm90aWZpZXJzIGZvciB0aGUgdW50
YWdnZWQgYWRkcmVzcyBnZXQgY29ycmVjdGx5IG1hdGNoZWQgdXAgd2l0aCB0aGUgcmlnaHQKQk8u
IFRoaXMgZnVuY2F0aW9uIGFsc28gY2FsbHMgcmFkZW9uX3R0bV90dF9waW5fdXNlcnB0cigpLCB3
aGljaCB1c2VzCnByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBj
YW4gb25seSBieSBkb25lIHdpdGgKdW50YWdnZWQgcG9pbnRlcnMuCgpUaGlzIHBhdGNoIHVudGFn
cyB1c2VyIHBvaW50ZXJzIGluIHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bCgpLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKaW5kZXggNDQ2MTdk
ZWM4MTgzLi45MGViNzhmYjVlYjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jCkBA
IC0yOTEsNiArMjkxLDggQEAgaW50IHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXVpbnQzMl90IGhhbmRsZTsKIAlpbnQgcjsKIAor
CWFyZ3MtPmFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFyZ3MtPmFkZHIpOworCiAJaWYgKG9mZnNldF9p
bl9wYWdlKGFyZ3MtPmFkZHIgfCBhcmdzLT5zaXplKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0g
CjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
