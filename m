Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835827100
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 22:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE8D890F0;
	Wed, 22 May 2019 20:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC93890F0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 20:47:38 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id r18so1617380pls.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 13:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zy3PazUIRm9Jc9PdJuB2u+ElFTk96lbYpo+oNBJZGCM=;
 b=YRQ2KYvfYvDZS0r3fCEhii237axboI2STIUbilOFWXZWTH+mzeLLfkyC7QStl3oXLJ
 41Vjm4gdo4Qyw+D4omyFsCZ3rtkf+auisENNIi8hjbaJ3arcnI8yi4wRXSK+RBmv+MPk
 9DbicVLZkfIhd+88hD0s+d+LbfOsrHh6s/vDZFgq29Vw12jk+UiDXR6NkU9V2o76UY0G
 cjehmIXE22B26mhEVVO7zfDk9j4U0XTgBoF05hxe4+1OViGGVUmnQCGCJkbIVJ+6SlUF
 XPTMI+0p00MAiSgMib+SmnwWiKbxrv3a6wtvv0Pls4Ym304DkiO8axT04LD39WcYcJiY
 YjuQ==
X-Gm-Message-State: APjAAAX0DGepEXu7E9WUvFnMP4khErluyvLEG6ttw0Ss8ngU3B3p+EC+
 EXOrY5+JS/LAxYOqLQ9s24SEGA==
X-Google-Smtp-Source: APXvYqxzAX+RobICkloaWYce4rx4oMkBv2QD394+NKxfoEao6LHAAvOlkD0rcjglQVK68ClP6ctquQ==
X-Received: by 2002:a17:902:15c5:: with SMTP id
 a5mr93624265plh.39.1558558058259; 
 Wed, 22 May 2019 13:47:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d13sm23312074pfh.113.2019.05.22.13.47.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 13:47:37 -0700 (PDT)
Date: Wed, 22 May 2019 13:47:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <201905221316.865581CF@keescook>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522163527.rnnc6t4tll7tk5zw@mbp>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zy3PazUIRm9Jc9PdJuB2u+ElFTk96lbYpo+oNBJZGCM=;
 b=Y8j7WD6zpcc/2sEpj8EY6NRT1Dc510C1spsir21/hkUeu4mUUaoDDgjLww0pivEwF/
 z6iJ0+f+gBw8re6q5xM6Dar0lLD7YYS2gJO3KPMVbNBtZ3Id3RkPfmb6s3Yr3rdRIcuf
 rTPZw7otg9Z5O5b4Ojw+hEe7n4misMdps/iC8=
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDU6MzU6MjdQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IFRoZSB0d28gaGFyZCByZXF1aXJlbWVudHMgSSBoYXZlIGZvciBzdXBwb3J0aW5n
IGFueSBuZXcgaGFyZHdhcmUgZmVhdHVyZQo+IGluIExpbnV4IGFyZSAoMSkgYSBzaW5nbGUga2Vy
bmVsIGltYWdlIGJpbmFyeSBjb250aW51ZXMgdG8gcnVuIG9uIG9sZAo+IGhhcmR3YXJlIHdoaWxl
IG1ha2luZyB1c2Ugb2YgdGhlIG5ldyBmZWF0dXJlIGlmIGF2YWlsYWJsZSBhbmQgKDIpIG9sZAo+
IHVzZXIgc3BhY2UgY29udGludWVzIHRvIHJ1biBvbiBuZXcgaGFyZHdhcmUgd2hpbGUgbmV3IHVz
ZXIgc3BhY2UgY2FuCj4gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIG5ldyBmZWF0dXJlLgoKQWdyZWVk
ISBBbmQgSSB0aGluayB0aGUgc2VyaWVzIG1lZXRzIHRoZXNlIHJlcXVpcmVtZW50cywgeWVzPwoK
PiBGb3IgTVRFLCB3ZSBqdXN0IGNhbid0IGVuYWJsZSBpdCBieSBkZWZhdWx0IHNpbmNlIHRoZXJl
IGFyZSBhcHBsaWNhdGlvbnMKPiB3aG8gdXNlIHRoZSB0b3AgYnl0ZSBvZiBhIHBvaW50ZXIgYW5k
IGV4cGVjdCBpdCB0byBiZSBpZ25vcmVkIHJhdGhlcgo+IHRoYW4gZmFpbGluZyB3aXRoIGEgbWlz
bWF0Y2hlZCB0YWcuIEp1c3QgdGhpbmsgb2YgYSBod2FzYW4gY29tcGlsZWQKPiBiaW5hcnkgd2hl
cmUgVEJJIGlzIGV4cGVjdGVkIHRvIHdvcmsgYW5kIHlvdSB0cnkgdG8gcnVuIGl0IHdpdGggTVRF
Cj4gdHVybmVkIG9uLgoKQWghIE9rYXksIGhlcmUncyB0aGUgdXNlLWNhc2UgSSB3YXNuJ3QgdGhp
bmtpbmcgb2Y6IHRoZSBjb25jZXJuIGlzIFRCSQpjb25mbGljdGluZyB3aXRoIE1URS4gQW5kIGFu
eXRoaW5nIHRoYXQgc3RhcnRzIHVzaW5nIFRCSSBzdWRkZW5seSBjYW4ndApydW4gaW4gdGhlIGZ1
dHVyZSBiZWNhdXNlIGl0J3MgYmVpbmcgaW50ZXJwcmV0ZWQgYXMgTVRFIGJpdHM/IChJcyB0aGF0
CnRoZSBBQkkgY29uY2Vybj8gSSBmZWVsIGxpa2Ugd2UgZ290IGludG8gdGhlIHdlZWRzIGFib3V0
IGlvY3RsKClzIGFuZApvbmUtb2ZmIGJ1Z3MuLi4pCgpTbyB0aGVyZSBuZWVkcyB0byBiZSBzb21l
IHdheSB0byBsZXQgdGhlIGtlcm5lbCBrbm93IHdoaWNoIG9mIHRocmVlCnRoaW5ncyBpdCBzaG91
bGQgYmUgZG9pbmc6CjEtIGxlYXZpbmcgdXNlcnNwYWNlIGFkZHJlc3NlcyBhcy1pcyAocHJlc2Vu
dCkKMi0gd2lwaW5nIHRoZSB0b3AgYml0cyBiZWZvcmUgdXNpbmcgKHRoaXMgc2VyaWVzKQozLSB3
aXBpbmcgdGhlIHRvcCBiaXRzIGZvciBtb3N0IHRoaW5ncywgYnV0IHJldGFpbmluZyB0aGVtIGZv
ciBNVEUgYXMKICAgbmVlZGVkICh0aGUgZnV0dXJlKQoKSSBleHBlY3QgTVRFIHRvIGJlIHRoZSAi
ZGVmYXVsdCIgaW4gdGhlIGZ1dHVyZS4gT25jZSBhIHN5c3RlbSdzIGxpYmMgaGFzCmdyb3duIHN1
cHBvcnQgZm9yIGl0LCBldmVyeXRoaW5nIHdpbGwgYmUgdHJ5aW5nIHRvIHVzZSBNVEUuIFRCSSB3
aWxsIGJlCnRoZSBzcGVjaWFsIGNhc2UgKGJ1dCBUQkkgaXMgZWZmZWN0aXZlbHkgYSBwcmVyZXF1
aXNpdGUpLgoKQUZBSUNULCB0aGUgb25seSBkaWZmZXJlbmNlIEkgc2VlIGJldHdlZW4gMiBhbmQg
MyB3aWxsIGJlIHRoZSB0YWcgaGFuZGxpbmcKaW4gdXNlcmNvcHkgKGFsbCBvdGhlciBwbGFjZXMg
d2lsbCBjb250aW51ZSB0byBpZ25vcmUgdGhlIHRvcCBiaXRzKS4gSXMKdGhhdCBhY2N1cmF0ZT8K
CklzICIxIiBhIHBlci1wcm9jZXNzIHN0YXRlIHdlIHdhbnQgdG8ga2VlcD8gKEkgYXNzdW1lIG5v
dCwgYnV0IHJhdGhlciBpdAppcyBhdmFpbGFibGUgdmlhIG5vIFRCSS9NVEUgQ09ORklHIG9yIGEg
Ym9vdC10aW1lIG9wdGlvbiwgaWYgYXQgYWxsPykKClRvIGNob29zZSBiZXR3ZWVuICIyIiBhbmQg
IjMiLCBpdCBzZWVtcyB3ZSBuZWVkIGEgcGVyLXByb2Nlc3MgZmxhZyB0bwpvcHQgaW50byBUQkkg
KGFuZCBvdXQgb2YgTVRFKS4gRm9yIHVzZXJzcGFjZSwgaG93IHdvdWxkIGEgZnV0dXJlIGJpbmFy
eQpjaG9vc2UgVEJJIG92ZXIgTVRFPyBJZiBpdCdzIGEgbGlicmFyeSBpc3N1ZSwgd2UgY2FuJ3Qg
dXNlIGFuIEVMRiBiaXQsCnNpbmNlIHRoZSBjaG9pY2UgbWF5IGJlICJsYXRlIiBhZnRlciBFTEYg
bG9hZCAodGhpcyBpbXBsaWVzIHRoZSBuZWVkCmZvciBhIHByY3RsKCkuKSBJZiBpdCdzIGJpbmFy
eS1vbmx5ICgiYnVpbHQgd2l0aCBIV0tBU2FuIikgdGhlbiBhbiBFTEYKYml0IHNlZW1zIHN1ZmZp
Y2llbnQuIEFuZCB3aXRob3V0IHRoZSBtYXJraW5nLCBJJ2QgZXhwZWN0IHRoZSBrZXJuZWwgdG8K
ZW5mb3JjZSBNVEUgd2hlbiB0aGVyZSBhcmUgaGlnaCBiaXRzLgoKPiBJIHdvdWxkIGFsc28gZXhw
ZWN0IHRoZSBDIGxpYnJhcnkgb3IgZHluYW1pYyBsb2FkZXIgdG8gY2hlY2sgZm9yIHRoZQo+IHBy
ZXNlbmNlIG9mIGEgSFdDQVBfTVRFIGJpdCBiZWZvcmUgc3RhcnRpbmcgdG8gdGFnIG1lbW9yeSBh
bGxvY2F0aW9ucywKPiBvdGhlcndpc2UgaXQgd291bGQgZ2V0IFNJR0lMTCBvbiB0aGUgZmlyc3Qg
TVRFIGluc3RydWN0aW9uIGl0IHRyaWVzIHRvCj4gZXhlY3V0ZS4KCkkndmUgZ290IHRoZSBzYW1l
IHF1ZXN0aW9uIGFzIEVsbGlvdDogYXJlbid0IE1URSBpbnN0cnVjdGlvbnMganVzdCBOT1AKdG8g
b2xkZXIgQ1BVcz8gSS5lLiBpZiB0aGUgQ1BVIChvciBrZXJuZWwpIGRvbid0IHN1cHBvcnQgaXQs
IGl0IGp1c3QKZ2V0cyBlbnRpcmVseSBpZ25vcmVkOiBjaGVja2luZyBpcyBvbmx5IG5lZWRlZCB0
byBzYXRpc2Z5IGN1cmlvc2l0eQpvciBiZWhhdmlvcmFsIGV4cGVjdGF0aW9ucy4KClRvIG1lLCB0
aGUgY29uZmxpY3Qgc2VlbXMgdG8gYmUgdXNpbmcgVEJJIGluIHRoZSBmYWNlIG9mIGV4cGVjdGlu
ZyBNVEUgdG8KYmUgdGhlIGRlZmF1bHQgc3RhdGUgb2YgdGhlIGZ1dHVyZS4gKEJ1dCB0aGUgaW50
ZXJuYWwgY2hhbmdlcyBuZWVkZWQKZm9yIFRCSSAtLSB0aGlzIHNlcmllcyAtLSBpcyBhIHByZXJl
cSBmb3IgTVRFLikKCi0tIApLZWVzIENvb2sKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
