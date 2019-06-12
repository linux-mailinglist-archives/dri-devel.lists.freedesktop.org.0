Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B828F433A4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F9189496;
	Thu, 13 Jun 2019 07:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9ED1289533;
 Wed, 12 Jun 2019 15:01:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B40A2B;
 Wed, 12 Jun 2019 08:01:00 -0700 (PDT)
Received: from C02TF0J2HF1T.local (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71C193F557;
 Wed, 12 Jun 2019 08:00:46 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:00:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Subject: Re: [PATCH v17 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <20190612150040.GH28951@C02TF0J2HF1T.local>
References: <cover.1560339705.git.andreyknvl@google.com>
 <e024234e652f23be4d76d63227de114e7def5dff.1560339705.git.andreyknvl@google.com>
 <7cd942c0-d4c1-0cf4-623a-bce6ef14d992@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cd942c0-d4c1-0cf4-623a-bce6ef14d992@arm.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
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
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <Vincenzo.Frascino@arm.com>, nd <nd@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave P Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <Robin.Murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6MzA6MzZQTSArMDEwMCwgU3phYm9sY3MgTmFneSB3
cm90ZToKPiBPbiAxMi8wNi8yMDE5IDEyOjQzLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFn
c19saWIuYwo+ID4gQEAgLTAsMCArMSw2MiBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCj4gPiArCj4gPiArI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ID4gKyNpbmNsdWRl
IDxzeXMvcHJjdGwuaD4KPiA+ICsKPiA+ICsjZGVmaW5lIFRBR19TSElGVAkoNTYpCj4gPiArI2Rl
ZmluZSBUQUdfTUFTSwkoMHhmZlVMIDw8IFRBR19TSElGVCkKPiA+ICsKPiA+ICsjZGVmaW5lIFBS
X1NFVF9UQUdHRURfQUREUl9DVFJMCTU1Cj4gPiArI2RlZmluZSBQUl9HRVRfVEFHR0VEX0FERFJf
Q1RSTAk1Ngo+ID4gKyNkZWZpbmUgUFJfVEFHR0VEX0FERFJfRU5BQkxFCSgxVUwgPDwgMCkKPiA+
ICsKPiA+ICt2b2lkICpfX2xpYmNfbWFsbG9jKHNpemVfdCBzaXplKTsKPiA+ICt2b2lkIF9fbGli
Y19mcmVlKHZvaWQgKnB0cik7Cj4gPiArdm9pZCAqX19saWJjX3JlYWxsb2Modm9pZCAqcHRyLCBz
aXplX3Qgc2l6ZSk7Cj4gPiArdm9pZCAqX19saWJjX2NhbGxvYyhzaXplX3Qgbm1lbWIsIHNpemVf
dCBzaXplKTsKPiAKPiB0aGlzIGRvZXMgbm90IHdvcmsgb24gYXQgbGVhc3QgbXVzbC4KPiAKPiB0
aGUgbW9zdCByb2J1c3Qgc29sdXRpb24gd291bGQgYmUgdG8gaW1wbGVtZW50Cj4gdGhlIG1hbGxv
YyBhcGlzIHdpdGggbW1hcC9tdW5tYXAvbXJlbWFwLCBpZiB0aGF0J3MKPiB0b28gY3VtYmVyc29t
ZSB0aGVuIHVzZSBkbHN5bSBSVExEX05FWFQgKGFsdGhvdWdoCj4gdGhhdCBoYXMgdGhlIHNsaWdo
dCB3YXJ0IHRoYXQgaW4gZ2xpYmMgaXQgbWF5IGNhbGwKPiBjYWxsb2Mgc28gd3JhcHBpbmcgY2Fs
bG9jIHRoYXQgd2F5IGlzIHRyaWNreSkuCj4gCj4gaW4gc2ltcGxlIGxpbnV4IHRlc3RzIGknZCBq
dXN0IHVzZSBzdGF0aWMgb3IKPiBzdGFjayBhbGxvY2F0aW9ucyBvciBtbWFwLgo+IAo+IGlmIGEg
Z2VuZXJpYyBwcmVsb2FkYWJsZSBsaWIgc29sdXRpb24gaXMgbmVlZGVkCj4gdGhlbiBkbyBpdCBw
cm9wZXJseSB3aXRoIHB0aHJlYWRfb25jZSB0byBhdm9pZAo+IHJhY2VzIGV0Yy4KClRoYW5rcyBm
b3IgdGhlIGZlZWRiYWNrIFN6YWJvbGNzLiBJIGd1ZXNzIHdlIGNhbiBnbyBiYWNrIHRvIHRoZSBp
bml0aWFsCnNpbXBsZSB0ZXN0IHRoYXQgQW5kcmV5IGhhZCBhbmQgZHJvcCB0aGUgd2hvbGUgTERf
UFJFTE9BRCBoYWNrIChJJ2xsCmp1c3QgdXNlIGl0IGZvciBteSBpbnRlcm5hbCB0ZXN0aW5nKS4K
CkJUVywgd2hlbiB5b3UgZ2V0IHNvbWUgdGltZSwgcGxlYXNlIHJldmlldyBWaW5jZW56bydzIEFC
SSBkb2N1bWVudGF0aW9uCnBhdGNoZXMgZnJvbSBhIHVzZXIvbGliYyBwZXJzcGVjdGl2ZS4gT25j
ZSBhZ3JlZWQsIHRoZXkgc2hvdWxkIGJlY29tZQpwYXJ0IG9mIHRoaXMgc2VyaWVzLgoKLS0gCkNh
dGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
