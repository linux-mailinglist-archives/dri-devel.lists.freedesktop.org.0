Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07805837B8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 19:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E9A6E4CA;
	Tue,  6 Aug 2019 17:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E658E6E4CA;
 Tue,  6 Aug 2019 17:13:45 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ACF82086D;
 Tue,  6 Aug 2019 17:13:39 +0000 (UTC)
Date: Tue, 6 Aug 2019 18:13:36 +0100
From: Will Deacon <will@kernel.org>
To: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190806171335.4dzjex5asoertaob@willie-the-truck>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724142059.GC21234@fuggles.cambridge.arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565111625;
 bh=GcwPgkJicx4YCfVs1IPwu6WwyqpK78qeXeT/YMfDkko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rTAT9bH7GKNJUZdS8BRtbH8phw4qgZ5+dRNFkldjVWk6dGxX0O1d/RnE/0V20gryu
 PTJMl31RRRdUsoRUBPiBr87DgRaB/HWSPKLtCibTJQQUtSYBOvQ2oBVDM1HUaAlT2q
 mkbOtB7+YYYk5DiFCNquMbqioXWuU2alu3yKrGRo=
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDM6MjA6NTlQTSArMDEwMCwgV2lsbCBEZWFjb24gd3Jv
dGU6Cj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDQ6MTY6NDlQTSArMDIwMCwgQW5kcmV5IEtv
bm92YWxvdiB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDQ6MDIgUE0gV2lsbCBE
ZWFjb24gPHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5
IGF0IDA4OjAzOjI5UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+ID4gU2hv
dWxkIHRoaXMgZ28gdGhyb3VnaCB0aGUgbW0gb3IgdGhlIGFybSB0cmVlPwo+ID4gPgo+ID4gPiBJ
IHdvdWxkIGNlcnRhaW5seSBwcmVmZXIgdG8gdGFrZSBhdCBsZWFzdCB0aGUgYXJtNjQgYml0cyB2
aWEgdGhlIGFybTY0IHRyZWUKPiA+ID4gKGkuZS4gcGF0Y2hlcyAxLCAyIGFuZCAxNSkuIFdlIGFs
c28gbmVlZCBhIERvY3VtZW50YXRpb24gcGF0Y2ggZGVzY3JpYmluZwo+ID4gPiB0aGUgbmV3IEFC
SS4KPiA+IAo+ID4gU291bmRzIGdvb2QhIFNob3VsZCBJIHBvc3QgdGhvc2UgcGF0Y2hlcyB0b2dl
dGhlciB3aXRoIHRoZQo+ID4gRG9jdW1lbnRhdGlvbiBwYXRjaGVzIGZyb20gVmluY2Vuem8gYXMg
YSBzZXBhcmF0ZSBwYXRjaHNldD8KPiAKPiBZZXMsIHBsZWFzZSAoYWx0aG91Z2ggYXMgeW91IHNh
eSBiZWxvdywgd2UgbmVlZCBhIG5ldyB2ZXJzaW9uIG9mIHRob3NlCj4gcGF0Y2hlcyBmcm9tIFZp
bmNlbnpvIHRvIGFkZHJlc3MgdGhlIGZlZWRiYWNrIG9uIHY1KS4gVGhlIG90aGVyIHRoaW5nIEkK
PiBzaG91bGQgc2F5IGlzIHRoYXQgSSdkIGJlIGhhcHB5IHRvIHF1ZXVlIHRoZSBvdGhlciBwYXRj
aGVzIGluIHRoZSBzZXJpZXMKPiB0b28sIGJ1dCBzb21lIG9mIHRoZW0gYXJlIG1pc3NpbmcgYWNr
cyBmcm9tIHRoZSByZWxldmFudCBtYWludGFpbmVycyAoZS5nLgo+IHRoZSBtbS8gYW5kIGZzLyBj
aGFuZ2VzKS4KCk9rLCBJJ3ZlIHF1ZXVlZCBwYXRjaGVzIDEsIDIsIGFuZCAxNSBvbiBhIHN0YWJs
ZSBicmFuY2ggaGVyZToKCiAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvYXJtNjQvbGludXguZ2l0L2xvZy8/aD1mb3ItbmV4dC90YmkKCndoaWNoIHNob3Vs
ZCBmaW5kIGl0cyB3YXkgaW50byAtbmV4dCBzaG9ydGx5IHZpYSBvdXIgZm9yLW5leHQvY29yZSBi
cmFuY2guCklmIHlvdSB3YW50IHRvIG1ha2UgY2hhbmdlcywgcGxlYXNlIHNlbmQgYWRkaXRpb25h
bCBwYXRjaGVzIG9uIHRvcC4KClRoaXMgaXMgdGFyZ2V0dGluZyA1LjQsIGJ1dCBJIHdpbGwgZHJv
cCBpdCBiZWZvcmUgdGhlIG1lcmdlIHdpbmRvdyBpZgp3ZSBkb24ndCBoYXZlIGJvdGggb2YgdGhl
IGZvbGxvd2luZyBpbiBwbGFjZToKCiAgKiBVcGRhdGVkIEFCSSBkb2N1bWVudGF0aW9uIHdpdGgg
QWNrcyBmcm9tIENhdGFsaW4gYW5kIEtldmluCiAgKiBUaGUgb3RoZXIgcGF0Y2hlcyBpbiB0aGUg
c2VyaWVzIGVpdGhlciBBY2tlZCAoc28gSSBjYW4gcGljayB0aGVtIHVwKQogICAgb3IgcXVldWVk
IHZpYSBzb21lIG90aGVyIHRyZWUocykgZm9yIDUuNC4KCk1ha2Ugc2Vuc2U/CgpDaGVlcnMsCgpX
aWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
