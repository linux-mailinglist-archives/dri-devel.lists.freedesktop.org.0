Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433A455C8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB03896E7;
	Fri, 14 Jun 2019 07:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73D9C8928B;
 Thu, 13 Jun 2019 16:16:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12AAE367;
 Thu, 13 Jun 2019 09:16:04 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB5643F694;
 Thu, 13 Jun 2019 09:15:58 -0700 (PDT)
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control the
 tagged user addresses ABI
To: Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613111659.GX28398@e103592.cambridge.arm.com>
 <20190613153505.GU28951@C02TF0J2HF1T.local>
 <99cc257d-5e99-922a-fbe7-3bbaf3621e38@arm.com>
 <20190613155754.GX28951@C02TF0J2HF1T.local>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <e481dbf9-880e-c77e-5200-1dbc35be7a48@arm.com>
Date: Thu, 13 Jun 2019 17:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613155754.GX28951@C02TF0J2HF1T.local>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Jacob Bramley <Jacob.Bramley@arm.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
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

Ck9uIDEzLzA2LzIwMTkgMTY6NTcsIENhdGFsaW4gTWFyaW5hcyB3cm90ZToKPiBPbiBUaHUsIEp1
biAxMywgMjAxOSBhdCAwNDo0NTo1NFBNICswMTAwLCBWaW5jZW56byBGcmFzY2lubyB3cm90ZToK
Pj4gT24gMTMvMDYvMjAxOSAxNjozNSwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+Pj4gT24gVGh1
LCBKdW4gMTMsIDIwMTkgYXQgMTI6MTY6NTlQTSArMDEwMCwgRGF2ZSBQIE1hcnRpbiB3cm90ZToK
Pj4+PiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMTo0MzoyMFBNICswMjAwLCBBbmRyZXkgS29u
b3ZhbG92IHdyb3RlOgo+Pj4+PiArCj4+Pj4+ICsvKgo+Pj4+PiArICogQ29udHJvbCB0aGUgcmVs
YXhlZCBBQkkgYWxsb3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIGludG8gdGhlIGtlcm5lbC4K
Pj4+Pj4gKyAqLwo+Pj4+PiArc3RhdGljIHVuc2lnbmVkIGludCB0YWdnZWRfYWRkcl9wcmN0bF9h
bGxvd2VkID0gMTsKPj4+Pj4gKwo+Pj4+PiArbG9uZyBzZXRfdGFnZ2VkX2FkZHJfY3RybCh1bnNp
Z25lZCBsb25nIGFyZykKPj4+Pj4gK3sKPj4+Pj4gKwlpZiAoIXRhZ2dlZF9hZGRyX3ByY3RsX2Fs
bG93ZWQpCj4+Pj4+ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4+Cj4+Pj4gU28sIHRhZ2dpbmcgY2Fu
IGFjdHVhbGx5IGJlIGxvY2tlZCBvbiBieSBoYXZpbmcgYSBwcm9jZXNzIGVuYWJsZSBpdCBhbmQK
Pj4+PiB0aGVuIHNvbWUgcG9zc2libHkgdW5yZWxhdGVkIHByb2Nlc3MgY2xlYXJpbmcgdGFnZ2Vk
X2FkZHJfcHJjdGxfYWxsb3dlZC4KPj4+PiBUaGF0IGZlZWxzIGEgYml0IHdlaXJkLgo+Pj4KPj4+
IFRoZSBwcm9ibGVtIGlzIHRoYXQgaWYgeW91IGRpc2FibGUgdGhlIEFCSSBnbG9iYWxseSwgbG90
cyBvZgo+Pj4gYXBwbGljYXRpb25zIHdvdWxkIGNyYXNoLiBUaGlzIHN5c2N0bCBpcyBtZWFudCBh
cyBhIHdheSB0byBkaXNhYmxlIHRoZQo+Pj4gb3B0LWluIHRvIHRoZSBUQkkgQUJJLiBBbm90aGVy
IG9wdGlvbiB3b3VsZCBiZSBhIGtlcm5lbCBjb21tYW5kIGxpbmUKPj4+IG9wdGlvbiAoSSdtIG5v
dCBrZWVuIG9uIGEgS2NvbmZpZyBvcHRpb24pLgo+Pgo+PiBXaHkgeW91IGFyZSBub3Qga2VlbiBv
biBhIEtjb25maWcgb3B0aW9uPwo+IAo+IEJlY2F1c2UgSSBkb24ndCB3YW50IHRvIHJlYnVpbGQg
dGhlIGtlcm5lbC9yZWJvb3QganVzdCB0byBiZSBhYmxlIHRvCj4gdGVzdCBob3cgdXNlciBzcGFj
ZSBoYW5kbGVzIHRoZSBBQkkgb3B0LWluLiBJJ20gb2sgd2l0aCBhIEtjb25maWcgb3B0aW9uCj4g
dG8gZGlzYWJsZSB0aGlzIGdsb2JhbGx5IGluIGFkZGl0aW9uIHRvIGEgcnVuLXRpbWUgb3B0aW9u
IChpZiBhY3R1YWxseQo+IG5lZWRlZCwgSSdtIG5vdCBzdXJlKS4KPiAKVGhlcmUgbWlnaHQgYmUg
c2NlbmFyaW9zIChpLmUuIGVtYmVkZGVkKSBpbiB3aGljaCB0aGlzIGlzIG5vdCBuZWVkZWQsIGhl
bmNlCmhhdmluZyBhIGNvbmZpZyBvcHRpb24gKG1heWJlIFkgYnkgZGVmYXVsdCkgdGhhdCByZW1v
dmVzIGZyb20gdGhlIGtlcm5lbCB0aGUKd2hvbGUgZmVhdHVyZSB3b3VsZCBiZSBnb29kLCBvYnZp
b3VzbHkgaW4gY29uanVuY3Rpb24gd2l0aCB0aGUgcnVuLXRpbWUgb3B0aW9uLgoKQmFzZWQgb24g
bXkgcHJldmlvdXMgcmV2aWV3LCBpZiB3ZSBtb3ZlIG91dCB0aGUgY29kZSBmcm9tIHByb2Nlc3Mu
YyBpbiBpdHMgb3duCmluZGVwZW5kZW50IGZpbGUgd2hlbiB0aGUgS2NvbmZpZyBvcHRpb24gaXMg
dHVybmVkIG9mZiB3ZSBjb3VsZCByZW1vdmUgdGhlCmVudGlyZSBvYmplY3QgZnJvbSB0aGUga2Vy
bmVsICh0aGlzIHdvdWxkIHJlbW92ZSB0aGUgc3lzY3RsIGFuZCBsZXQgc3RpbGwgdGhlCnByY3Rs
IHJldHVybiAtRUlOVkFMKS4KClRoZXNlIGNoYW5nZXMgdGhvdWdoIGNvdWxkIGJlIGRvbmUgc3Vj
Y2Vzc2l2ZWx5IHdpdGggYSBzZXBhcmF0ZSBwYXRjaCBzZXQsIGlmCnRoZSBLY29uZmlnIGlzIG1l
YW50IHRvIGJlIFkgYnkgZGVmYXVsdC4KCi0tIApSZWdhcmRzLApWaW5jZW56bwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
