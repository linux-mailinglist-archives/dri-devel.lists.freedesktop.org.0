Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D386D4D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA946ECD7;
	Thu,  8 Aug 2019 22:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD04E6ECD7;
 Thu,  8 Aug 2019 22:33:02 +0000 (UTC)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1ECB5216C8;
 Thu,  8 Aug 2019 22:33:01 +0000 (UTC)
Date: Thu, 8 Aug 2019 15:33:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-Id: <20190808153300.09d3eb80772515f0ea062833@linux-foundation.org>
In-Reply-To: <201908081410.C16D2BD@keescook>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
 <20190806171335.4dzjex5asoertaob@willie-the-truck>
 <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
 <201908081410.C16D2BD@keescook>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565303582;
 bh=M1LHDKT+Utjw2MuliMFXwjmQGIz79EFLeGhC6jmdeW8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rJm/bKIjqOczu37MctJclbvuCqDc2bjNbCOceXgrdzzO5jdTQq59GCZBl+aaSOFHo
 JWftfKITVhkjQlcdggzJR5GIR3v5lckbgstfbb5fdsE0+HHu12+i5Q62vy30iUhD6A
 xVNDNvwKYNXCR25osWwquW4PqKI0St9mmWBTs9xA=
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA4IEF1ZyAyMDE5IDE0OjEyOjE5IC0wNzAwIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPiB3cm90ZToKCj4gPiBUaGUgb25lcyB0aGF0IGFyZSBsZWZ0IGFyZSB0aGUgbW0g
b25lczogNCwgNSwgNiwgNyBhbmQgOC4KPiA+IAo+ID4gQW5kcmV3LCBjb3VsZCB5b3UgdGFrZSBh
IGxvb2sgYW5kIGdpdmUgeW91ciBBY2tlZC1ieSBvciBwaWNrIHRoZW0gdXAgZGlyZWN0bHk/Cj4g
Cj4gR2l2ZW4gdGhlIHN1YnN5c3RlbSBBY2tzLCBpdCBzZWVtcyBsaWtlIDMtMTAgYW5kIDEyIGNv
dWxkIGFsbCBqdXN0IGdvCj4gdmlhIEFuZHJldz8gSSBob3BlIGhlIGFncmVlcy4gOikKCkknbGwg
Z3JhYiBldmVyeXRoaW5nIHRoYXQgaGFzIG5vdCB5ZXQgYXBwZWFyZWQgaW4gbGludXgtbmV4dC4g
IElmIG1vcmUKb2YgdGhlc2UgcGF0Y2hlcyBhcHBlYXIgaW4gbGludXgtbmV4dCBJJ2xsIGRyb3Ag
dGhvc2UgYXMgd2VsbC4KClRoZSByZXZpZXcgZGlzY3Vzc2lvbiBhZ2FpbnN0ICIgW1BBVENIIHYx
OSAwMi8xNV0gYXJtNjQ6IEludHJvZHVjZQpwcmN0bCgpIG9wdGlvbnMgdG8gY29udHJvbCB0aGUg
dGFnZ2VkIHVzZXIgYWRkcmVzc2VzIEFCSSIgaGFzIHBldGVyZWQKb3V0IGluY29uY2x1c2l2ZWx5
LiAgcHJjdGwoKSB2cyBhcmNoX3ByY3RsKCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
