Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A715E20
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1276D89E03;
	Tue,  7 May 2019 07:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6391089970
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:53:13 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y13so6807856pfm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 06:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfsikH3ADmgNVGOW8dVHffAJXBPBy/1Drd0IdtpjjJ8=;
 b=oFe5dGG7VHP7Axknv3elxROdwMXnh7X9MV9HDg+TkZlwAcqGe9zb818CSdf08Tzlv5
 Qwa2X3MStfzKtw4U/s+SeLFJ2DD/JlbV+dzHpDvfaEei6Nc50bWILl0UhfsNA/kpmAVr
 tDNn97wcSxZoTZS1od5rgQRnZeWr5edM31uFcSi9ElRm1TKJO8GMA/y0f4rZQFJ+XtW1
 6KZQlH1UQmL3wW1pmK1+Ra4X9t4Nu9UiiibP0jyugU+TEzMtDlPyJmKIEKpiEnLBw1PC
 yX89QSxVRl0Qu2QmGNPXvN4+rs1IdTPl4kWrIKUU/HVEQnv11z8QqvlX5BTFy9hOHzTp
 MEcg==
X-Gm-Message-State: APjAAAVnJcxv8KyeunErf0QfgPBCwHwhdI4nfNwdYMfYMWBh11XMZMaB
 +UrtuLNWwKDmH8TKGKqZjTLSXipLWEFkdenyPHSaOA==
X-Google-Smtp-Source: APXvYqz1fgwxD3Q1L0PJp0GBoiDCnAmVuD+UduBO6dKustad4HqnmYC98uMKFLNp2x7D5yl19BVMVIT9EGy2Pg34Ktk=
X-Received: by 2002:aa7:9116:: with SMTP id 22mr33262822pfh.165.1557150792655; 
 Mon, 06 May 2019 06:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
 <8e20df035de677029b3f970744ba2d35e2df1db3.1556630205.git.andreyknvl@google.com>
 <20190503165113.GJ55449@arrakis.emea.arm.com>
In-Reply-To: <20190503165113.GJ55449@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 6 May 2019 15:53:01 +0200
Message-ID: <CAAeHK+wCyCa-5=bPNwfivP6sEODOXKE1bPjcjc2y_T4rN+-6gA@mail.gmail.com>
Subject: Re: [PATCH v14 08/17] mm,
 arm64: untag user pointers in get_vaddr_frames
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DfsikH3ADmgNVGOW8dVHffAJXBPBy/1Drd0IdtpjjJ8=;
 b=kv7aGbZwowOP86IiNXKGTzv02HGdI2dS555U/AmH12LgQOZnKLK39c4sVdRuufn96A
 qthFKSfdn7G60uj86be1sn6Yz08bEym7ZdQPS1mHAwXca2PX4G4xwzBsumjfQSNalrzf
 yL5bwTZ9P03pKULjLPyCJCemso/1RN2dFNxsJkh8Db8dDQ4uyTu4XB2OtIwgRdUtOIbE
 AyYkrbplUjKWiH4tJjgIH/K5mFuPdBD8NVSdZa64NURA8ieEyhpOBhaJlBUr1GIoMIGp
 v2ptbSyS2qLsf62uamUc0COAt9buSU1YrXxFbkm18U+53rgjezb09axtZoHwZgv8hVgU
 L1Yg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Chintan Pandya <cpandya@codeaurora.org>, Felix <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kuehling@google.com, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA2OjUxIFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MjU6
MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggaXMgYSBw
YXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRv
Cj4gPiBwYXNzIHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0ZSBzZXQgdG8g
c29tZXRoaW5nIGVsc2Ugb3RoZXIKPiA+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMu
Cj4gPgo+ID4gZ2V0X3ZhZGRyX2ZyYW1lcyB1c2VzIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9y
IHZtYSBsb29rdXBzLCB3aGljaCBjYW4KPiA+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBv
aW50ZXJzLiBJbnN0ZWFkIG9mIGxvY2F0aW5nIGFuZCBjaGFuZ2luZwo+ID4gYWxsIGNhbGxlcnMg
b2YgdGhpcyBmdW5jdGlvbiwgcGVyZm9ybSB1bnRhZ2dpbmcgaW4gaXQuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4gLS0t
Cj4gPiAgbW0vZnJhbWVfdmVjdG9yLmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9tbS9mcmFtZV92ZWN0b3IuYyBiL21tL2Zy
YW1lX3ZlY3Rvci5jCj4gPiBpbmRleCBjNjRkY2E2ZTI3YzIuLmM0MzFjYTgxZGFkNSAxMDA2NDQK
PiA+IC0tLSBhL21tL2ZyYW1lX3ZlY3Rvci5jCj4gPiArKysgYi9tbS9mcmFtZV92ZWN0b3IuYwo+
ID4gQEAgLTQ2LDYgKzQ2LDggQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9uZyBz
dGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKPiA+ICAgICAgIGlmIChXQVJOX09OX09OQ0Uo
bnJfZnJhbWVzID4gdmVjLT5ucl9hbGxvY2F0ZWQpKQo+ID4gICAgICAgICAgICAgICBucl9mcmFt
ZXMgPSB2ZWMtPm5yX2FsbG9jYXRlZDsKPiA+Cj4gPiArICAgICBzdGFydCA9IHVudGFnZ2VkX2Fk
ZHIoc3RhcnQpOwo+ID4gKwo+ID4gICAgICAgZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+ID4g
ICAgICAgbG9ja2VkID0gMTsKPiA+ICAgICAgIHZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlvbiht
bSwgc3RhcnQsIHN0YXJ0ICsgMSk7Cj4KPiBJcyB0aGlzIHNvbWUgYnVmZmVyIHRoYXQgdGhlIHVz
ZXIgbWF5IGhhdmUgbWFsbG9jJ2VkPyBJIGdvdCBsb3N0IHdoZW4KPiB0cnlpbmcgdG8gdHJhY2sg
ZG93biB0aGUgcHJvdmVuaWVuY2Ugb2YgdGhpcyBidWZmZXIuCgpUaGUgY2FsbGVyIHRoYXQgSSBm
b3VuZCB3aGVuIEkgd2FzIGxvb2tpbmcgYXQgdGhpczoKCmRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9nMmQuYzo0ODIKZXh5bm9zX2cyZF9zZXRfY21kbGlzdF9pb2N0bCgpLT5nMmRf
bWFwX2NtZGxpc3RfZ2VtKCktPmcyZF91c2VycHRyX2dldF9kbWFfYWRkcigpLT5nZXRfdmFkZHJf
ZnJhbWVzKCkKCj4KPiAtLQo+IENhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
