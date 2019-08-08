Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6BE86C20
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 23:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853076ECBC;
	Thu,  8 Aug 2019 21:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210116ECBF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 21:12:22 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z14so7463402pga.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 14:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ylddyGuuUpJhKUvK1ev1Q44hiLLmL8PwyC4MRMb3mUE=;
 b=U+N4HNC5yVazCqUnO02wbLfXUXJdInDrCFuaFn6RY+zweya7ilY4HC7P8DM8NESPyO
 OAsMx8wovI5zh0G+OWWjP8rstj3uGYTnIm8+0RpagP2BlIps4v7jz+nbi0+s2G5164O1
 HhYYNXENelxLOBkh4dTGUBOZ0Sdmu/Q0SETs/3gaThD9X6ZLDFhXh5Q7to64PtPa7PLU
 zyT0lmMPYUs3fzcvA7DLvtRHDJO0uVCiPxyj6BmsbQAoikpJWk5tkG9CoMKEGkzo69rN
 8clK+Tp2BsTMckrMOTYL8x9oD/LDGdCFDwduF/ZZFLTU+bdnN+aAcpKv5FG6oPjOW7Qt
 CWHg==
X-Gm-Message-State: APjAAAX51cH/XAUx3fUy6uCIzQeS4tnI/4BtTIveX4JCY9Jnb+s02W8H
 gsVusof7HObEmhla77DvzLoM/g==
X-Google-Smtp-Source: APXvYqy0pdWoHPkerneL5407ilt1ySmaIIJNjNXYxB0G6sGkOR++FLPJzal2z8CcZbjPxvclbtt+OA==
X-Received: by 2002:a62:1750:: with SMTP id 77mr17827956pfx.172.1565298741745; 
 Thu, 08 Aug 2019 14:12:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q19sm101457867pfc.62.2019.08.08.14.12.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Aug 2019 14:12:20 -0700 (PDT)
Date: Thu, 8 Aug 2019 14:12:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <201908081410.C16D2BD@keescook>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
 <20190806171335.4dzjex5asoertaob@willie-the-truck>
 <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ylddyGuuUpJhKUvK1ev1Q44hiLLmL8PwyC4MRMb3mUE=;
 b=ACf43qcDjfXfx13Z+1Gsw1UZV/Uosrf1yEiF0Agjii4NCq0aSJm4NT0QzSwLCl7Dc5
 gq+wLSnVQcR3qxZ0fm9hvoSL16jb4cCF5OkMFfCEBQn0MQdPfLlk2tDzdSCLPp3vIQBd
 UxRwIr8unIchMakLD/5qyLX3unblGeVjDLQfg=
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

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDc6MTc6MzVQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBUdWUsIEF1ZyA2LCAyMDE5IGF0IDc6MTMgUE0gV2lsbCBEZWFjb24gPHdp
bGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDM6
MjA6NTlQTSArMDEwMCwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVsIDI0LCAy
MDE5IGF0IDA0OjE2OjQ5UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+ID4g
T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgNDowMiBQTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDA4OjAzOjI5UE0g
KzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+ID4gPiA+IFNob3VsZCB0aGlzIGdv
IHRocm91Z2ggdGhlIG1tIG9yIHRoZSBhcm0gdHJlZT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHdv
dWxkIGNlcnRhaW5seSBwcmVmZXIgdG8gdGFrZSBhdCBsZWFzdCB0aGUgYXJtNjQgYml0cyB2aWEg
dGhlIGFybTY0IHRyZWUKPiA+ID4gPiA+IChpLmUuIHBhdGNoZXMgMSwgMiBhbmQgMTUpLiBXZSBh
bHNvIG5lZWQgYSBEb2N1bWVudGF0aW9uIHBhdGNoIGRlc2NyaWJpbmcKPiA+ID4gPiA+IHRoZSBu
ZXcgQUJJLgo+ID4gPiA+Cj4gPiA+ID4gU291bmRzIGdvb2QhIFNob3VsZCBJIHBvc3QgdGhvc2Ug
cGF0Y2hlcyB0b2dldGhlciB3aXRoIHRoZQo+ID4gPiA+IERvY3VtZW50YXRpb24gcGF0Y2hlcyBm
cm9tIFZpbmNlbnpvIGFzIGEgc2VwYXJhdGUgcGF0Y2hzZXQ/Cj4gPiA+Cj4gPiA+IFllcywgcGxl
YXNlIChhbHRob3VnaCBhcyB5b3Ugc2F5IGJlbG93LCB3ZSBuZWVkIGEgbmV3IHZlcnNpb24gb2Yg
dGhvc2UKPiA+ID4gcGF0Y2hlcyBmcm9tIFZpbmNlbnpvIHRvIGFkZHJlc3MgdGhlIGZlZWRiYWNr
IG9uIHY1KS4gVGhlIG90aGVyIHRoaW5nIEkKPiA+ID4gc2hvdWxkIHNheSBpcyB0aGF0IEknZCBi
ZSBoYXBweSB0byBxdWV1ZSB0aGUgb3RoZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzCj4gPiA+IHRv
bywgYnV0IHNvbWUgb2YgdGhlbSBhcmUgbWlzc2luZyBhY2tzIGZyb20gdGhlIHJlbGV2YW50IG1h
aW50YWluZXJzIChlLmcuCj4gPiA+IHRoZSBtbS8gYW5kIGZzLyBjaGFuZ2VzKS4KPiA+Cj4gPiBP
aywgSSd2ZSBxdWV1ZWQgcGF0Y2hlcyAxLCAyLCBhbmQgMTUgb24gYSBzdGFibGUgYnJhbmNoIGhl
cmU6Cj4gPgo+ID4gICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9hcm02NC9saW51eC5naXQvbG9nLz9oPWZvci1uZXh0L3RiaQo+ID4KPiA+IHdoaWNoIHNo
b3VsZCBmaW5kIGl0cyB3YXkgaW50byAtbmV4dCBzaG9ydGx5IHZpYSBvdXIgZm9yLW5leHQvY29y
ZSBicmFuY2guCj4gPiBJZiB5b3Ugd2FudCB0byBtYWtlIGNoYW5nZXMsIHBsZWFzZSBzZW5kIGFk
ZGl0aW9uYWwgcGF0Y2hlcyBvbiB0b3AuCj4gPgo+ID4gVGhpcyBpcyB0YXJnZXR0aW5nIDUuNCwg
YnV0IEkgd2lsbCBkcm9wIGl0IGJlZm9yZSB0aGUgbWVyZ2Ugd2luZG93IGlmCj4gPiB3ZSBkb24n
dCBoYXZlIGJvdGggb2YgdGhlIGZvbGxvd2luZyBpbiBwbGFjZToKPiA+Cj4gPiAgICogVXBkYXRl
ZCBBQkkgZG9jdW1lbnRhdGlvbiB3aXRoIEFja3MgZnJvbSBDYXRhbGluIGFuZCBLZXZpbgo+IAo+
IENhdGFsaW4gaGFzIHBvc3RlZCBhIG5ldyB2ZXJzaW9uIHRvZGF5Lgo+IAo+ID4gICAqIFRoZSBv
dGhlciBwYXRjaGVzIGluIHRoZSBzZXJpZXMgZWl0aGVyIEFja2VkIChzbyBJIGNhbiBwaWNrIHRo
ZW0gdXApCj4gPiAgICAgb3IgcXVldWVkIHZpYSBzb21lIG90aGVyIHRyZWUocykgZm9yIDUuNC4K
PiAKPiBTbyB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBpbiB0aGlzIHNlcmllczoKPiAK
PiAxLiBhcm02NDogdW50YWcgdXNlciBwb2ludGVycyBpbiBhY2Nlc3Nfb2sgYW5kIF9fdWFjY2Vz
c19tYXNrX3B0cgo+IDIuIGFybTY0OiBJbnRyb2R1Y2UgcHJjdGwoKSBvcHRpb25zIHRvIGNvbnRy
b2wgdGhlIHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBBQkkKPiAzLiBsaWI6IHVudGFnIHVzZXIgcG9p
bnRlcnMgaW4gc3RybipfdXNlcgo+IDQuIG1tOiB1bnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0
byBtZW1vcnkgc3lzY2FsbHMKPiA1LiBtbTogdW50YWcgdXNlciBwb2ludGVycyBpbiBtbS9ndXAu
Ywo+IDYuIG1tOiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIGdldF92YWRkcl9mcmFtZXMKPiA3LiBm
cy9uYW1lc3BhY2U6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gY29weV9tb3VudF9vcHRpb25zCj4g
OC4gdXNlcmZhdWx0ZmQ6IHVudGFnIHVzZXIgcG9pbnRlcnMKPiA5LiBkcm0vYW1kZ3B1OiB1bnRh
ZyB1c2VyIHBvaW50ZXJzCj4gMTAuIGRybS9yYWRlb246IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4g
cmFkZW9uX2dlbV91c2VycHRyX2lvY3RsCj4gMTEuIElCL21seDQ6IHVudGFnIHVzZXIgcG9pbnRl
cnMgaW4gbWx4NF9nZXRfdW1lbV9tcgo+IDEyLiBtZWRpYS92NGwyLWNvcmU6IHVudGFnIHVzZXIg
cG9pbnRlcnMgaW4gdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dldAo+IDEzLiB0ZWUvc2htOiB1
bnRhZyB1c2VyIHBvaW50ZXJzIGluIHRlZV9zaG1fcmVnaXN0ZXIKPiAxNC4gdmZpby90eXBlMTog
dW50YWcgdXNlciBwb2ludGVycyBpbiB2YWRkcl9nZXRfcGZuCj4gMTUuIHNlbGZ0ZXN0cywgYXJt
NjQ6IGFkZCBhIHNlbGZ0ZXN0IGZvciBwYXNzaW5nIHRhZ2dlZCBwb2ludGVycyB0byBrZXJuZWwK
PiAKPiAxLCAyIGFuZCAxNSBoYXZlIGJlZW4gcGlja2VkIGJ5IFdpbGwuCj4gCj4gMTEgaGFzIGJl
ZW4gcGlja2VkIHVwIGJ5IEphc29uLgo+IAo+IDksIDEwLCAxMiwgMTMgYW5kIDE0IGhhdmUgYWNr
cyBmcm9tIHRoZWlyIHN1YnN5c3RlbSBtYWludGFpbmVycy4KPiAKPiAzIHRvdWNoZXMgZ2VuZXJp
YyBsaWIgY29kZSwgSSdtIG5vdCBzdXJlIGlmIHRoZXJlJ3MgYSBkZWRpY2F0ZWQKPiBtYWludGFp
bmVyIGZvciB0aGF0LgoKQW5kcmV3IHRlbmRzIHRvIHBpY2sgdXAgbGliLyBwYXRjaGVzLgoKPiBU
aGUgb25lcyB0aGF0IGFyZSBsZWZ0IGFyZSB0aGUgbW0gb25lczogNCwgNSwgNiwgNyBhbmQgOC4K
PiAKPiBBbmRyZXcsIGNvdWxkIHlvdSB0YWtlIGEgbG9vayBhbmQgZ2l2ZSB5b3VyIEFja2VkLWJ5
IG9yIHBpY2sgdGhlbSB1cCBkaXJlY3RseT8KCkdpdmVuIHRoZSBzdWJzeXN0ZW0gQWNrcywgaXQg
c2VlbXMgbGlrZSAzLTEwIGFuZCAxMiBjb3VsZCBhbGwganVzdCBnbwp2aWEgQW5kcmV3PyBJIGhv
cGUgaGUgYWdyZWVzLiA6KQoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
