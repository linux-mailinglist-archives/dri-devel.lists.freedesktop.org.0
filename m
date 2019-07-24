Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDA74819
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE076E639;
	Thu, 25 Jul 2019 07:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB9956E600;
 Wed, 24 Jul 2019 17:12:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E49528;
 Wed, 24 Jul 2019 10:12:26 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CE253F71F;
 Wed, 24 Jul 2019 10:12:21 -0700 (PDT)
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
To: Will Deacon <will.deacon@arm.com>, Andrey Konovalov <andreyknvl@google.com>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <f27f4e55-fcd6-9ae7-d9ca-cac2aea5fe70@arm.com>
Date: Wed, 24 Jul 2019 18:12:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724142059.GC21234@fuggles.cambridge.arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
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
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Jacob Bramley <Jacob.Bramley@arm.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgV2lsbCBhbmQgQW5kcmV5LAoKT24gMjQvMDcvMjAxOSAxNToyMCwgV2lsbCBEZWFjb24gd3Jv
dGU6Cj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDQ6MTY6NDlQTSArMDIwMCwgQW5kcmV5IEtv
bm92YWxvdiB3cm90ZToKPj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgNDowMiBQTSBXaWxsIERl
YWNvbiA8d2lsbEBrZXJuZWwub3JnPiB3cm90ZToKPj4+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0
IDA4OjAzOjI5UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4+Pj4gT24gVHVlLCBK
dWwgMjMsIDIwMTkgYXQgNzo1OSBQTSBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2ds
ZS5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiA9PT0gT3ZlcnZpZXcKPj4+Pj4KPj4+Pj4gYXJtNjQg
aGFzIGEgZmVhdHVyZSBjYWxsZWQgVG9wIEJ5dGUgSWdub3JlLCB3aGljaCBhbGxvd3MgdG8gZW1i
ZWQgcG9pbnRlcgo+Pj4+PiB0YWdzIGludG8gdGhlIHRvcCBieXRlIG9mIGVhY2ggcG9pbnRlci4g
VXNlcnNwYWNlIHByb2dyYW1zIChzdWNoIGFzCj4+Pj4+IEhXQVNhbiwgYSBtZW1vcnkgZGVidWdn
aW5nIHRvb2wgWzFdKSBtaWdodCB1c2UgdGhpcyBmZWF0dXJlIGFuZCBwYXNzCj4+Pj4+IHRhZ2dl
ZCB1c2VyIHBvaW50ZXJzIHRvIHRoZSBrZXJuZWwgdGhyb3VnaCBzeXNjYWxscyBvciBvdGhlciBp
bnRlcmZhY2VzLgo+Pj4+Pgo+Pj4+PiBSaWdodCBub3cgdGhlIGtlcm5lbCBpcyBhbHJlYWR5IGFi
bGUgdG8gaGFuZGxlIHVzZXIgZmF1bHRzIHdpdGggdGFnZ2VkCj4+Pj4+IHBvaW50ZXJzLCBkdWUg
dG8gdGhlc2UgcGF0Y2hlczoKPj4+Pj4KPj4+Pj4gMS4gODFjZGRkNjUgKCJhcm02NDogdHJhcHM6
IGZpeCB1c2Vyc3BhY2UgY2FjaGUgbWFpbnRlbmFuY2UgZW11bGF0aW9uIG9uIGEKPj4+Pj4gICAg
ICAgICAgICAgIHRhZ2dlZCBwb2ludGVyIikKPj4+Pj4gMi4gN2RjZDlkZDggKCJhcm02NDogaHdf
YnJlYWtwb2ludDogZml4IHdhdGNocG9pbnQgbWF0Y2hpbmcgZm9yIHRhZ2dlZAo+Pj4+PiAgICAg
ICAgICAgICAgIHBvaW50ZXJzIikKPj4+Pj4gMy4gMjc2ZTkzMjcgKCJhcm02NDogZW50cnk6IGlt
cHJvdmUgZGF0YSBhYm9ydCBoYW5kbGluZyBvZiB0YWdnZWQKPj4+Pj4gICAgICAgICAgICAgICBw
b2ludGVycyIpCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2hzZXQgZXh0ZW5kcyB0YWdnZWQgcG9pbnRl
ciBzdXBwb3J0IHRvIHN5c2NhbGwgYXJndW1lbnRzLgo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+IERv
IHlvdSB0aGluayB0aGlzIGlzIHJlYWR5IHRvIGJlIG1lcmdlZD8KPj4+Pgo+Pj4+IFNob3VsZCB0
aGlzIGdvIHRocm91Z2ggdGhlIG1tIG9yIHRoZSBhcm0gdHJlZT8KPj4+Cj4+PiBJIHdvdWxkIGNl
cnRhaW5seSBwcmVmZXIgdG8gdGFrZSBhdCBsZWFzdCB0aGUgYXJtNjQgYml0cyB2aWEgdGhlIGFy
bTY0IHRyZWUKPj4+IChpLmUuIHBhdGNoZXMgMSwgMiBhbmQgMTUpLiBXZSBhbHNvIG5lZWQgYSBE
b2N1bWVudGF0aW9uIHBhdGNoIGRlc2NyaWJpbmcKPj4+IHRoZSBuZXcgQUJJLgo+Pgo+PiBTb3Vu
ZHMgZ29vZCEgU2hvdWxkIEkgcG9zdCB0aG9zZSBwYXRjaGVzIHRvZ2V0aGVyIHdpdGggdGhlCj4+
IERvY3VtZW50YXRpb24gcGF0Y2hlcyBmcm9tIFZpbmNlbnpvIGFzIGEgc2VwYXJhdGUgcGF0Y2hz
ZXQ/Cj4gCj4gWWVzLCBwbGVhc2UgKGFsdGhvdWdoIGFzIHlvdSBzYXkgYmVsb3csIHdlIG5lZWQg
YSBuZXcgdmVyc2lvbiBvZiB0aG9zZQo+IHBhdGNoZXMgZnJvbSBWaW5jZW56byB0byBhZGRyZXNz
IHRoZSBmZWVkYmFjayBvbiB2NSkuIFRoZSBvdGhlciB0aGluZyBJCj4gc2hvdWxkIHNheSBpcyB0
aGF0IEknZCBiZSBoYXBweSB0byBxdWV1ZSB0aGUgb3RoZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVz
Cj4gdG9vLCBidXQgc29tZSBvZiB0aGVtIGFyZSBtaXNzaW5nIGFja3MgZnJvbSB0aGUgcmVsZXZh
bnQgbWFpbnRhaW5lcnMgKGUuZy4KPiB0aGUgbW0vIGFuZCBmcy8gY2hhbmdlcykuCj4gCgpJIGFt
IGFjdGl2ZWx5IHdvcmtpbmcgb24gdGhlIGRvY3VtZW50IGFuZCB3aWxsIHNoYXJlIHY2IHdpdGgg
dGhlIHJlcXVlc3RlZApjaGFuZ2VzIGluIHRoZSBuZXh0IGZldyBkYXlzLgoKPiBXaWxsCj4gCgot
LSAKUmVnYXJkcywKVmluY2Vuem8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
