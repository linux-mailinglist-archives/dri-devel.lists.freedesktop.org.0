Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45739AA5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 06:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1289221;
	Sat,  8 Jun 2019 04:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501158921C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 04:00:28 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id e5so1529739pls.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 21:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YJBSSsNH8TcUO3Ycp4J72yQtEEm/T/jL9xlaGf6pvZI=;
 b=LvCSf2oPvX1bcwpgxBQ9wTB5y/yWfFaqEEWj7z6Mx4us0LYEwekEB6mvD/NdAHubIx
 szg+7zb+gpD6x6JoO0+bOX7VadtGx416OrADJTPU+aA/v1xhTDe3lewZh6/e/brqZc7l
 Q8mFft+adP6PNptO2mSWMOgIin+fsAuhmUd5LS1Xsk6qMRiiGhMtzZAReQBr6LywC0GQ
 8h5lqkY58KrkJHHdL+XwMWSNw37H6R3EX31nSg02BExDyBruRNT265jPoFmqor6hBQ0w
 OsEf/4J4H5rCayAsNCRcVw4y3NiziyEScUwMY+vspMxwRZmviI8s1xQef7m+7VSCChlO
 LoWA==
X-Gm-Message-State: APjAAAWO4aswVxKZr4qrZU5ZmJ43pCW40JFaP8OLdMDsGXP/iJC+0zA4
 qA5cSyHt/KJ34H7LNaaf8/vdlQ==
X-Google-Smtp-Source: APXvYqzHeK0TqpcqthfQS0PvnOaTM79D0qX0jOvsUb1vmxMb45KBYDAyFtX8G3vNYgX7ILuQ8oms2A==
X-Received: by 2002:a17:902:a516:: with SMTP id
 s22mr20509311plq.178.1559966427983; 
 Fri, 07 Jun 2019 21:00:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q1sm6873405pfb.156.2019.06.07.21.00.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 21:00:27 -0700 (PDT)
Date: Fri, 7 Jun 2019 21:00:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 07/16] mm, arm64: untag user pointers in
 get_vaddr_frames
Message-ID: <201906072059.69C8284A0E@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YJBSSsNH8TcUO3Ycp4J72yQtEEm/T/jL9xlaGf6pvZI=;
 b=SIGHIuBbHjdFD2NYvbt1juZyNlfYo8T13G3oRQwScPFyvz27E5QmOWxjQJHoK99WBn
 Ze60epVcGs+lOMqYkRKqCgC9UKlerLVaaZ1FhvQY+1i8DraNj5oIlnKwiTKses761SQn
 gTwBZBGZ3BV+37p5XRC1XuqiURHbiOTUskj5E=
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
 Khalid Aziz <khalid.aziz@oracle.com>, Matthew Wilcox <willy@infradead.org>,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gZ2V0X3ZhZGRyX2ZyYW1lcyB1c2VzIHByb3Zp
ZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBsb29rdXBzLCB3aGljaCBjYW4KPiBvbmx5IGJ5IGRv
bmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4gSW5zdGVhZCBvZiBsb2NhdGluZyBhbmQgY2hhbmdp
bmcKPiBhbGwgY2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uLCBwZXJmb3JtIHVudGFnZ2luZyBpbiBp
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2ds
ZS5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cgot
S2VlcwoKPiAtLS0KPiAgbW0vZnJhbWVfdmVjdG9yLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vZnJhbWVfdmVjdG9yLmMgYi9t
bS9mcmFtZV92ZWN0b3IuYwo+IGluZGV4IGM2NGRjYTZlMjdjMi4uYzQzMWNhODFkYWQ1IDEwMDY0
NAo+IC0tLSBhL21tL2ZyYW1lX3ZlY3Rvci5jCj4gKysrIGIvbW0vZnJhbWVfdmVjdG9yLmMKPiBA
QCAtNDYsNiArNDYsOCBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAo+ICAJaWYgKFdBUk5fT05fT05DRShucl9mcmFtZXMg
PiB2ZWMtPm5yX2FsbG9jYXRlZCkpCj4gIAkJbnJfZnJhbWVzID0gdmVjLT5ucl9hbGxvY2F0ZWQ7
Cj4gIAo+ICsJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiArCj4gIAlkb3duX3JlYWQo
Jm1tLT5tbWFwX3NlbSk7Cj4gIAlsb2NrZWQgPSAxOwo+ICAJdm1hID0gZmluZF92bWFfaW50ZXJz
ZWN0aW9uKG1tLCBzdGFydCwgc3RhcnQgKyAxKTsKPiAtLSAKPiAyLjIyLjAucmMxLjMxMS5nNWQ3
NTczYTE1MS1nb29nCj4gCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
