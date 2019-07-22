Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE37085B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3BD89DA6;
	Mon, 22 Jul 2019 18:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA8389DA6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:22:24 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id s41so12570759ybe.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nChDLJOZPg7dPTNM27Gi/1xsGavkYn+CO9mE5CxGd8w=;
 b=r+C/pbGua0gaXrLYHyWQyA4Y1z7gtn9+3uitXi6gwE8h5CVEJ53wtxs9Ej4oKNfT/h
 O4popWjYSB7CkHAC8MTghgpcU7wAyT/DDUrUZvG331Jnh1AlClIHEYZguxZ1LxLyQoQN
 YuVNhKkcrw/J/t6vYTEdqRFiZcZ9BwXHuKio56Y6wEeZKV4b+P7CjbieS+ozNzCp26+J
 ezXGBR+B8oOWtifcOm3CyTc+up07hAzYR22ksxAJK8DoFruRem9YEiHXluHF1R/ExrPg
 b1UQwBK6+kt5mScA9a5zcSERM0gHJNy+fynNsjpMtvXBeaKbNssSRB4A3TemDlD498J5
 QTcw==
X-Gm-Message-State: APjAAAWmKj/GcNZmkoWG4NUt4Y+XurMy71CYJX3tFy61HrgqBuUgsWB4
 1T+ZEgU7vq7ZZxgSu1oxHcN+3A==
X-Google-Smtp-Source: APXvYqyNe4/QXZs1k+6KJuGPYrieeEeXhzyaOjBwKUya6lRtwyXSjnlyvXe7M/SBsJJaQgWqVE3edw==
X-Received: by 2002:a25:7c05:: with SMTP id x5mr43951829ybc.358.1563819743691; 
 Mon, 22 Jul 2019 11:22:23 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id u123sm9932475ywu.75.2019.07.22.11.22.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:22:23 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:22:22 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: correct NULL pointer dereference in
 context_init
Message-ID: <20190722182222.GG104440@art_vandelay>
References: <20190627020515.5660-1-masneyb@onstation.org>
 <CAF6AEGvFE46aKCBP5de_Bx_hFcTyF0Vc9B1PebBZjGZmw9zh2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvFE46aKCBP5de_Bx_hFcTyF0Vc9B1PebBZjGZmw9zh2g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nChDLJOZPg7dPTNM27Gi/1xsGavkYn+CO9mE5CxGd8w=;
 b=Vk0ki42HNnol9MsZVJosQk17CkKb6y36mdKMVgVZAn2LD6+9qeDwF4ob45XpGyYdLg
 p17NL9kJ0JMQGeO6qoaEOwfDtQetW9UoiFxjlSC6wgBXha+g+AY57eDWvRTKiV/03OGU
 u54O4ff4XDkRGhYb7gG2emESK74nvP5F/kUyT6CAIpj3B54NvkovkSku55PrwuVTkckT
 KnV7pSjg57YUvmmzFufiU3B43Oplk8wkzgentsMSbQNZ5lG8G+14hmrb5+07fm3NQnu0
 AYyRduf5r7vrW3pgIBnEox0Hte4GItyMPvn6COmqz+hyyK60U0ys9Dc6cliaaLVcxX1F
 euGQ==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDU6NTc6MjZBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDc6MDUgUE0gQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IENvcnJlY3QgYXR0ZW1wdGVkIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZSBpbiBjb250ZXh0X2luaXQoKSB3aGVuCj4gPiBydW5uaW5nIHdpdGhv
dXQgYW4gSU9NTVUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+Cj4gPiBGaXhlczogMjk1YjIyYWU1OTZjICgiZHJtL21zbTogUGFzcyB0
aGUgTU1VIGRvbWFpbiBpbmRleCBpbiBzdHJ1Y3QgbXNtX2ZpbGVfcHJpdmF0ZSIpCj4gPiAtLS0K
PiA+IFRoZSBubyBJT01NVSBjYXNlIHNlZW1zIGxpa2UgZnVuY3Rpb25hbGl0eSB0aGF0IHdlIG1h
eSB3YW50IHRvIGtlZXAKPiA+IGJhc2VkIG9uIHRoaXMgY29tbWVudDoKPiA+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTN4eF9ncHUuYyNMNTIzCj4gPiBPbmNlIEkgZ2V0IHRoZSBtc204OTc0IGludGVyY29u
bmVjdCBkcml2ZXIgZG9uZSwgSSdtIGdvaW5nIHRvIGxvb2sgaW50bwo+ID4gd2hhdCBuZWVkcyB0
byBiZSBkb25lIHRvIGdldCB0aGUgSU9NTVUgd29ya2luZyBvbiB0aGUgTmV4dXMgNS4KPiA+Cj4g
PiBBbHRlcm5hdGl2ZWx5LCBmb3IgZGV2ZWxvcG1lbnQgcHVycG9zZXMsIG1heWJlIHdlIGNvdWxk
IGhhdmUgYSBOT09QCj4gPiBJT01NVSBkcml2ZXIgdGhhdCB3b3VsZCBhbGxvdyB1cyB0byByZW1v
dmUgdGhlc2UgTlVMTCBjaGVja3MgdGhhdCBhcmUKPiA+IHNwcmlua2xlZCB0aHJvdWdob3V0IHRo
ZSBjb2RlLiBJIGhhdmVuJ3QgbG9va2VkIGludG8gdGhpcyBpbiBkZXRhaWwuCj4gPiBUaG91Z2h0
cz8KPiAKPiB5ZWFoLCB3ZSBwcm9iYWJseSB3YW50IHRvIGtlZXAgIWlvbW11IHN1cHBvcnQsIGl0
IGlzIGF0IGxlYXN0IHVzZWZ1bAo+IGZvciBicmluZ3VwIG9mIG5ldyAob3Igb2xkKSBkZXZpY2Vz
LiAgQnV0IHRlbmRzIHRvIGJpdHJvdCBhIHNpbmNlIGl0Cj4gaXNuJ3QgYSBjYXNlIHRoYXQgZ2V0
cyB0ZXN0ZWQgbXVjaCBvbmNlIGlvbW11IGlzIGluIHBsYWNlLiAgUGVyaGFwcwo+IHRoZXJlIGlz
IGEgd2F5IHRvIGhhdmUgYSBudWxsIGlvbW11L2FzcGFjZSwgYWx0aG91Z2ggSSdtIG5vdCBxdWl0
ZQo+IHN1cmUgaG93IHRoYXQgd291bGQgd29yay4uCj4gCj4gQW55d2F5cywKPiAKPiBSZXZpZXdl
ZC1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+IAo+IChJIGd1ZXNzIHRoaXMg
Y2FuIGdvIGluIHZpYSBkcm0tbWlzYy1maXhlcyB1bmxlc3Mgd2UgZ2V0IHNvbWUgbW9yZQo+IGZp
eGVzIHRvIGp1c3RpZnkgc2VuZGluZyBtc20tZml4ZXMgTVIuLikKCkFwcGxpZWQgdG8gZHJtLW1p
c2MtZml4ZXMgZm9yIDUuMwoKU2VhbgoKPiAKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZHJ2LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKPiA+IGluZGV4IDQ1MWJkNDUwODc5
My4uODMwNDdjYjJjNzM1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
ZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCj4gPiBAQCAtNjE5
LDcgKzYxOSw3IEBAIHN0YXRpYyBpbnQgY29udGV4dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPiA+Cj4gPiAgICAgICAgIG1zbV9zdWJtaXRxdWV1
ZV9pbml0KGRldiwgY3R4KTsKPiA+Cj4gPiAtICAgICAgIGN0eC0+YXNwYWNlID0gcHJpdi0+Z3B1
LT5hc3BhY2U7Cj4gPiArICAgICAgIGN0eC0+YXNwYWNlID0gcHJpdi0+Z3B1ID8gcHJpdi0+Z3B1
LT5hc3BhY2UgOiBOVUxMOwo+ID4gICAgICAgICBmaWxlLT5kcml2ZXJfcHJpdiA9IGN0eDsKPiA+
Cj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBGcmVlZHJlbm8gbWFp
bGluZyBsaXN0Cj4gPiBGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwoKLS0gClNl
YW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
