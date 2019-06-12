Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A043384
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C478893CB;
	Thu, 13 Jun 2019 07:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0CE89496
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:08:47 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id t16so9453669pfe.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w620wCIkG8GXS/KYH0IDoZ7ej5kJ3WmWx8LtN+LbTUQ=;
 b=g1/GYPhh8Ox2LKmzUGghoyBe8taBgbb4QgRbEnBl/rQvBnJBoauSbqaQb3eqD7MwYI
 sj749nStnNs+ct+oxiK72fEdRR+4XBuY/TcXXRHUxI09tX61tRnFfF3Fqh16G/60QtBq
 51CKB/pDIFFbPht66Eizw0BDpr6eabzSBTsl+DPO3mS402mqDOT2iQlxJDIkRzriNqAc
 njRzPzhGbF34U4LAue/vbKSJBWplmHZDSzTpl4DFt7m2SVEM/xoxwRYyimSpeC3Q5uap
 XbznShjIWlHO4RGEN9VDFB1TCV8fOg8bKYkA5qbtYmn5aKpx9HVVQ2RGHctY0zydZppD
 vpGw==
X-Gm-Message-State: APjAAAWz0ezYvEXPQWGENjLT0H0RZALV3hrgTph2D5MyWrMAiBCUIPz4
 cRQqldckoJjYz4OMTIQ+/UGOS1tOAQgRLnXV+q0l2w==
X-Google-Smtp-Source: APXvYqxvUwlKkJ1D0n5ZAgi1aKr005PngCLgks22Vr4JdWsBWlki9wY2M2Qsc1xcmNb71INK9Pq98aEQaKS4b6HnOls=
X-Received: by 2002:aa7:97bb:: with SMTP id d27mr18449962pfq.93.1560337726555; 
 Wed, 12 Jun 2019 04:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
 <d0dffcf8-d7bf-a7b4-5766-3a6f87437851@oracle.com>
In-Reply-To: <d0dffcf8-d7bf-a7b4-5766-3a6f87437851@oracle.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 12 Jun 2019 13:08:35 +0200
Message-ID: <CAAeHK+yTmU9Vz0OB4b7bcgjU3W1v6NFxgpiy4tud7j0AHXkwtw@mail.gmail.com>
Subject: Re: [PATCH v16 04/16] mm: untag user pointers in do_pages_move
To: Khalid Aziz <khalid.aziz@oracle.com>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w620wCIkG8GXS/KYH0IDoZ7ej5kJ3WmWx8LtN+LbTUQ=;
 b=VggNUJ7a0brq2Ev6nAJQqO2O72gohucw8zeY5YtHck9VQOLSeh4HE1gegC/6IXwwZQ
 yGU57RiXcKZXz6rEKzU45Xf6W2ce+VRfcbyLnBuDiGAB0WY+oQBhpKyfWyvJoxfZX9DP
 yh5EZsvMAI815IqL/1YdyEKkghoO2fuJKDAzd5Q9y/OjjRwPS+GPbIwNDHqKiLuIYdn3
 FS/k/NQyAktrRCCDybeyESanVpXbjmTwdROU2U/U+lx1nc+kfxYxbzF+ximhp+/PoGPk
 LddaTqB/qiSjwgqbl0KdSRDedqW9qTDDWoaJfcFucWGR/PYqdZ87SzwkAPpr4TVyN7Wo
 N3Qg==
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
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6MTggUE0gS2hhbGlkIEF6aXogPGtoYWxpZC5heml6
QG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gNi8zLzE5IDEwOjU1IEFNLCBBbmRyZXkgS29ub3Zh
bG92IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRl
bmRzIGFybTY0IGtlcm5lbCBBQkkgdG8gYWxsb3cgdG8KPiA+IHBhc3MgdGFnZ2VkIHVzZXIgcG9p
bnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+ID4g
dGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiA+Cj4gPiBkb19wYWdlc19tb3ZlKCkg
aXMgdXNlZCBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIG1vdmVfcGFnZXMgc3lzY2FsbC4K
PiA+Cj4gPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoaXMgZnVuY3Rpb24uCj4gPgo+ID4gUmV2
aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4g
PiAtLS0KPiA+ICBtbS9taWdyYXRlLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vbWlncmF0ZS5jIGIvbW0vbWlncmF0ZS5j
Cj4gPiBpbmRleCBmMmVjYzI4NTVhMTIuLjM5MzBiYjZmYTY1NiAxMDA2NDQKPiA+IC0tLSBhL21t
L21pZ3JhdGUuYwo+ID4gKysrIGIvbW0vbWlncmF0ZS5jCj4gPiBAQCAtMTYxNyw2ICsxNjE3LDcg
QEAgc3RhdGljIGludCBkb19wYWdlc19tb3ZlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBub2RlbWFz
a190IHRhc2tfbm9kZXMsCj4gPiAgICAgICAgICAgICAgIGlmIChnZXRfdXNlcihub2RlLCBub2Rl
cyArIGkpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZsdXNoOwo+ID4gICAg
ICAgICAgICAgICBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcDsKPiA+ICsgICAgICAgICAgICAgYWRk
ciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4KPiBXaHkgbm90IGp1c3QgImFkZHIgPSAodW5zaWdu
ZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHApOyIKCldpbGwgZG8gaW4gdGhlIG5leHQgdmVyc2lvbi4g
SSB0aGluayBJJ2xsIGFsc28gbWVyZ2UgdGhpcyBjb21taXQgaW50bwp0aGUgInVudGFnIHVzZXIg
cG9pbnRlcnMgcGFzc2VkIHRvIG1lbW9yeSBzeXNjYWxscyIgb25lLgoKPgo+IC0tCj4gS2hhbGlk
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
