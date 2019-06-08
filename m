Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B4639A6D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E349C891C3;
	Sat,  8 Jun 2019 03:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781D6891C3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:51:10 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h2so2148072pgg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3wKfqS97rJvrbhUUDlvq7gOlHPn2Fxrd7rOcfg+ujIw=;
 b=hIFDMnyUSDG6/3yPEKRDIFagiQRQj9yvN52Ppo8ijUtGp9CpEubglWiLz0WzlvvFcA
 egz80latkJdcHZNWCuJfCkY2oI3sQmGvF0MBuO5wVOifnp4ktSSetGtRZb6koruhJ1qa
 /bP/XoHW2ytFxF8amNh8vvESIBIqTVek3JPLceRS5X6oH8U2s1JpjX9YYioJFxoc/N9/
 i49YENnHHmcG6Ft8AUaqAlSteANqV8rT3aRITUmTovB9wMMSrWpbC7Eyxi/zfyCi3SAt
 5RtmxMXbyUcEX0TOFH0KBCKEf5GrOsvN6Pfb0M0jL6+Cc4zO0oJeMXSZpOW9mXrMMf01
 oagg==
X-Gm-Message-State: APjAAAV1Hs2d+dgAicw1LoZ/FSCE3qajtoN736jFTfrIVx6spA9m9UWf
 mryDRMNqBahdnKmPDt2Dq4RwcQ==
X-Google-Smtp-Source: APXvYqw907PVDblcTVkonPdzATNJGir/Lb4Vx1Ol6psoQ6Dh4wHkfs9go3mE5W0bvdvS6vG2+lgMCw==
X-Received: by 2002:a63:161b:: with SMTP id w27mr5796313pgl.338.1559965870042; 
 Fri, 07 Jun 2019 20:51:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e4sm3563052pgi.80.2019.06.07.20.51.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:51:09 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:51:08 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
Message-ID: <201906072051.3047B3DC56@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3wKfqS97rJvrbhUUDlvq7gOlHPn2Fxrd7rOcfg+ujIw=;
 b=RYl1PwRkMzex6A4O7SLxvvwiq5dij7m4eHDLUNE4a3aGBYLeVjbDL8gLqao1EoQT+p
 YQb1mF9o9UcoV8td3+9AP7z+CkGq6mDaNnYR3pzaWwp8gUl1cHoE4YNqEbgWKNWvGAFB
 0KAoZe50aGSCoeHmlFMZ5SpxFp6+d2TadDVto=
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
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gY29weV9mcm9tX3VzZXIgKGFuZCBhIGZldyBv
dGhlciBzaW1pbGFyIGZ1bmN0aW9ucykgYXJlIHVzZWQgdG8gY29weSBkYXRhCj4gZnJvbSB1c2Vy
IG1lbW9yeSBpbnRvIHRoZSBrZXJuZWwgbWVtb3J5IG9yIHZpY2UgdmVyc2EuIFNpbmNlIGEgdXNl
ciBjYW4KPiBwcm92aWRlZCBhIHRhZ2dlZCBwb2ludGVyIHRvIG9uZSBvZiB0aGUgc3lzY2FsbHMg
dGhhdCB1c2UgY29weV9mcm9tX3VzZXIsCj4gd2UgbmVlZCB0byBjb3JyZWN0bHkgaGFuZGxlIHN1
Y2ggcG9pbnRlcnMuCj4gCj4gRG8gdGhpcyBieSB1bnRhZ2dpbmcgdXNlciBwb2ludGVycyBpbiBh
Y2Nlc3Nfb2sgYW5kIGluIF9fdWFjY2Vzc19tYXNrX3B0ciwKPiBiZWZvcmUgcGVyZm9ybWluZyBh
Y2Nlc3MgdmFsaWRpdHkgY2hlY2tzLgo+IAo+IE5vdGUsIHRoYXQgdGhpcyBwYXRjaCBvbmx5IHRl
bXBvcmFyaWx5IHVudGFncyB0aGUgcG9pbnRlcnMgdG8gcGVyZm9ybSB0aGUKPiBjaGVja3MsIGJ1
dCB0aGVuIHBhc3NlcyB0aGVtIGFzIGlzIGludG8gdGhlIGtlcm5lbCBpbnRlcm5hbHMuCj4gCj4g
UmV2aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgoK
UmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgoKLUtlZXMKCj4g
LS0tCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMTAgKysrKysrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gaW5kZXggZTVkNWYzMWM2ZDM2Li45MTY0ZWNiNWZlY2Eg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9h
cmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IEBAIC05NCw3ICs5NCw3IEBAIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX3JhbmdlX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRy
LCB1bnNpZ25lZCBsb25nIHNpCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IC0jZGVmaW5lIGFj
Y2Vzc19vayhhZGRyLCBzaXplKQlfX3JhbmdlX29rKGFkZHIsIHNpemUpCj4gKyNkZWZpbmUgYWNj
ZXNzX29rKGFkZHIsIHNpemUpCV9fcmFuZ2Vfb2sodW50YWdnZWRfYWRkcihhZGRyKSwgc2l6ZSkK
PiAgI2RlZmluZSB1c2VyX2FkZHJfbWF4CQkJZ2V0X2ZzCj4gIAo+ICAjZGVmaW5lIF9BU01fRVhU
QUJMRShmcm9tLCB0bykJCQkJCQlcCj4gQEAgLTIyNiw3ICsyMjYsOCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdWFjY2Vzc19lbmFibGVfbm90X3Vhbyh2b2lkKQo+ICAKPiAgLyoKPiAgICogU2FuaXRp
c2UgYSB1YWNjZXNzIHBvaW50ZXIgc3VjaCB0aGF0IGl0IGJlY29tZXMgTlVMTCBpZiBhYm92ZSB0
aGUKPiAtICogY3VycmVudCBhZGRyX2xpbWl0Lgo+ICsgKiBjdXJyZW50IGFkZHJfbGltaXQuIElu
IGNhc2UgdGhlIHBvaW50ZXIgaXMgdGFnZ2VkIChoYXMgdGhlIHRvcCBieXRlIHNldCksCj4gKyAq
IHVudGFnIHRoZSBwb2ludGVyIGJlZm9yZSBjaGVja2luZy4KPiAgICovCj4gICNkZWZpbmUgdWFj
Y2Vzc19tYXNrX3B0cihwdHIpIChfX3R5cGVvZl9fKHB0cikpX191YWNjZXNzX21hc2tfcHRyKHB0
cikKPiAgc3RhdGljIGlubGluZSB2b2lkIF9fdXNlciAqX191YWNjZXNzX21hc2tfcHRyKGNvbnN0
IHZvaWQgX191c2VyICpwdHIpCj4gQEAgLTIzNCwxMCArMjM1LDExIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBfX3VzZXIgKl9fdWFjY2Vzc19tYXNrX3B0cihjb25zdCB2b2lkIF9fdXNlciAqcHRyKQo+
ICAJdm9pZCBfX3VzZXIgKnNhZmVfcHRyOwo+ICAKPiAgCWFzbSB2b2xhdGlsZSgKPiAtCSIJYmlj
cwl4enIsICUxLCAlMlxuIgo+ICsJIgliaWNzCXh6ciwgJTMsICUyXG4iCj4gIAkiCWNzZWwJJTAs
ICUxLCB4enIsIGVxXG4iCj4gIAk6ICI9JnIiIChzYWZlX3B0cikKPiAtCTogInIiIChwdHIpLCAi
ciIgKGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRkcl9saW1pdCkKPiArCTogInIiIChwdHIpLCAi
ciIgKGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRkcl9saW1pdCksCj4gKwkgICJyIiAodW50YWdn
ZWRfYWRkcihwdHIpKQo+ICAJOiAiY2MiKTsKPiAgCj4gIAljc2RiKCk7Cj4gLS0gCj4gMi4yMi4w
LnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwo+IAoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
