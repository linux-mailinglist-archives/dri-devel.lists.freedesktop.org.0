Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19DE36D514
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196416EADD;
	Wed, 28 Apr 2021 09:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1136EADD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:54:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h4so53307662wrt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IlYwp9hy/qyuoO7J9M6kgU+swiX3y4LrMmMZpwhtVCc=;
 b=Plx8y72PEuz8HC+HE1dcT80RT9tv1Jvnvk+Xlc6p9A1LVD7hdKoJ8Do30PMpWThB4F
 wRYWaA4U7JlK0HleNsxPxxp5bWEnJ4vjC660eWuLWmABtXgngCI4liBJ83zrRFdyVl+O
 nu4yvTJm66x6h62rCLzGKNoNFcvUIuAeY0svU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IlYwp9hy/qyuoO7J9M6kgU+swiX3y4LrMmMZpwhtVCc=;
 b=kXv9QwZnc1U8Jw6BnSE0qiSyAEUSna3ktWiyGQgBlLkrbhvQIzSK/xBCY+peWz00+4
 bmqsSRxsDYCRTMCBThN6/kSCdzh7U8dlkPeCuN6eNYJaCMYEMjGeZJOSFegDqPJaHR47
 ddlYfeaHoKjO535lxRdr3vOaKvN++aEc20g6317LgnFlOIsGwzf1q/Y/TqViW9DMm4Bk
 obyLN2klfJnbNCpbVHQGZjIlfjnv8bdeHRX3DyihkjcfkW9IhvkdR6iGBunGbKgItmIS
 VeVgPoF3idb0iBCpxxPWKFmWD9GuVggyxxmrolUEuJLAsKO5sm13ii2CF9r1eboyJR6L
 wryg==
X-Gm-Message-State: AOAM532DZgwJFCIiJbE1GXpPn/fRYH7I0Sal1tW1+cMCg3jXa7MjGcEv
 DZWTzbpB0I+5lfGfjQQbqizrSw==
X-Google-Smtp-Source: ABdhPJx5s9ON1fJg7vHhrznvuSrIHbvOVirPuSGxavPm92CVw7kDWKbm27PoZPEiexwF6jNboPmL+Q==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr36010214wru.146.1619603651761; 
 Wed, 28 Apr 2021 02:54:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm214134wrt.58.2021.04.28.02.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 02:54:10 -0700 (PDT)
Date: Wed, 28 Apr 2021 11:54:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIkwwD1z7r4BbEZU@phenom.ffwll.local>
References: <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
 <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
 <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjgsIDIwMjEgYXQgMDg6NTk6NDdBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBIaSBEYXZlLAo+IAo+IEFtIDI3LjA0LjIxIHVtIDIxOjIzIHNjaHJpZWIgTWFy
ZWsgT2zFocOhazoKPiA+IFN1cHBvcnRpbmcgaW50ZXJvcCB3aXRoIGFueSBkZXZpY2UgaXMgYWx3
YXlzIHBvc3NpYmxlLiBJdCBkZXBlbmRzIG9uCj4gPiB3aGljaCBkcml2ZXJzIHdlIG5lZWQgdG8g
aW50ZXJvcGVyYXRlIHdpdGggYW5kIHVwZGF0ZSB0aGVtLiBXZSd2ZQo+ID4gYWxyZWFkeSBmb3Vu
ZCB0aGUgcGF0aCBmb3J3YXJkIGZvciBhbWRncHUuIFdlIGp1c3QgbmVlZCB0byBmaW5kIG91dCBo
b3cKPiA+IG1hbnkgb3RoZXIgZHJpdmVycyBuZWVkIHRvIGJlIHVwZGF0ZWQgYW5kIGV2YWx1YXRl
IHRoZSBjb3N0L2JlbmVmaXQKPiA+IGFzcGVjdC4KPiA+IAo+ID4gTWFyZWsKPiA+IAo+ID4gT24g
VHVlLCBBcHIgMjcsIDIwMjEgYXQgMjozOCBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20KPiA+IDxtYWlsdG86YWlybGllZEBnbWFpbC5jb20+PiB3cm90ZToKPiA+IAo+ID4gICAgIE9u
IFR1ZSwgMjcgQXByIDIwMjEgYXQgMjI6MDYsIENocmlzdGlhbiBLw7ZuaWcKPiA+ICAgICA8Y2tv
ZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20KPiA+ICAgICA8bWFpbHRvOmNrb2VuaWcubGVp
Y2h0enVtZXJrZW5AZ21haWwuY29tPj4gd3JvdGU6Cj4gPiAgICAgPgo+ID4gICAgID4gQ29ycmVj
dCwgd2Ugd291bGRuJ3QgaGF2ZSBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiBkZXZpY2Ugd2l0aAo+
ID4gICAgIGFuZCB3aXRob3V0IHVzZXIgcXVldWVzIGFueSBtb3JlLgo+ID4gICAgID4KPiA+ICAg
ICA+IFRoYXQgY291bGQgb25seSBiZSBhIHByb2JsZW0gZm9yIEErSSBMYXB0b3BzLgo+ID4gCj4g
PiAgICAgU2luY2UgSSB0aGluayB5b3UgbWVudGlvbmVkIHlvdSdkIG9ubHkgYmUgZW5hYmxpbmcg
dGhpcyBvbiBuZXdlcgo+ID4gICAgIGNoaXBzZXRzLCB3b24ndCBpdCBiZSBhIHByb2JsZW0gZm9y
IEErQSB3aGVyZSBvbmUgQSBpcyBhIGdlbmVyYXRpb24KPiA+ICAgICBiZWhpbmQgdGhlIG90aGVy
Pwo+ID4gCj4gCj4gQ3JhcCwgdGhhdCBpcyBhIGdvb2QgcG9pbnQgYXMgd2VsbC4KPiAKPiA+IAo+
ID4gICAgIEknbSBub3QgcmVhbGx5IGxpa2luZyB3aGVyZSB0aGlzIGlzIGdvaW5nIGJ0dywgc2Vl
bXMgbGlrZSBhIGlsbAo+ID4gICAgIHRob3VnaHQgb3V0IGNvbmNlcHQsIGlmIEFNRCBpcyByZWFs
bHkgZ29pbmcgZG93biB0aGUgcm9hZCBvZiBkZXNpZ25pbmcKPiA+ICAgICBodyB0aGF0IGlzIGN1
cnJlbnRseSBMaW51eCBpbmNvbXBhdGlibGUsIHlvdSBhcmUgZ29pbmcgdG8gaGF2ZSB0bwo+ID4g
ICAgIGFjY2VwdCBhIGJpZyBwYXJ0IG9mIHRoZSBidXJkZW4gaW4gYnJpbmdpbmcgdGhpcyBzdXBw
b3J0IGluIHRvIG1vcmUKPiA+ICAgICB0aGFuIGp1c3QgYW1kIGRyaXZlcnMgZm9yIHVwY29taW5n
IGdlbmVyYXRpb25zIG9mIGdwdS4KPiA+IAo+IAo+IFdlbGwgd2UgZG9uJ3QgcmVhbGx5IGxpa2Ug
dGhhdCBlaXRoZXIsIGJ1dCB3ZSBoYXZlIG5vIG90aGVyIG9wdGlvbiBhcyBmYXIgYXMKPiBJIGNh
biBzZWUuCj4gCj4gSSBoYXZlIGEgY291cGxlIG9mIGlkZWFzIGhvdyB0byBoYW5kbGUgdGhpcyBp
biB0aGUga2VybmVsIHdpdGhvdXQKPiBkbWFfZmVuY2VzLCBidXQgaXQgYWx3YXlzIHJlcXVpcmUg
bW9yZSBvciBsZXNzIGNoYW5nZXMgdG8gYWxsIGV4aXN0aW5nCj4gZHJpdmVycy4KClllYWggb25l
IGhvcnJpYmxlIGlkZWEgaXMgdG8gZXNzZW50aWFsbHkgZG8gdGhlIHBsYW4gd2UgaGFzaGVkIG91
dCBmb3IKYWRkaW5nIHVzZXJzcGFjZSBmZW5jZXMgdG8gZHJtX3N5bmNvYmogdGltZWxpbmVzLiBB
bmQgdGhlbiBhZGQgZHJtX3N5bmNvYmoKYXMgYW5vdGhlciBpbXBsaWNpdCBmZW5jaW5nIHRoaW5n
IHRvIGRtYS1idWYuCgpCdXQ6Ci0gVGhpcyBpcyBob3JyaWJsZS4gV2UncmUgYWxsIGFncmVlaW5n
IHRoYXQgaW1wbGljaXQgc3luYyBpcyBub3QgYSBncmVhdAogIGlkZWEsIGJ1aWxkaW5nIGFuIGVu
dGlyZSBuZXcgd29ybGQgb24gdGhpcyBmbGF3ZWQgdGhpbmcgZG9lc24ndCBzb3VuZAogIGxpa2Ug
YSBnb29kIHBhdGggZm9yd2FyZC4KCi0gSXQncyBrZXJuZWwgdWFwaSwgc28gaXQncyBnb2luZyB0
byBiZSBmb3JldmVyLgoKLSBJdCdzIG9ubHkgZml4aW5nIHRoZSBjb3JyZWN0bmVzcyBpc3N1ZSwg
c2luY2UgeW91IGhhdmUgdG8gc3RhbGwgZm9yCiAgZnV0dXJlL2luZGVmaW5pdGUgZmVuY2VzIGF0
IHRoZSBiZWdpbm5pbmcgb2YgdGhlIENTIGlvY3RsLiBPciBhdCB0aGUKICBiZWdpbm5pbmcgb2Yg
dGhlIGF0b21pYyBtb2Rlc2V0IGlvY3RsLCB3aGljaCBraW5kYSBkZWZlYXRzIHRoZSBwb2ludCBv
ZgogIG5vbmJsb2NraW5nLgoKLSBZb3Ugc3RpbGwgaGF2ZSB0byB0b3VjaCBhbGwga21kIGRyaXZl
cnMuCgotIEZvciBwZXJmb3JtYW5jZSwgeW91IHN0aWxsIGhhdmUgdG8gZ2x1ZSBhIHN1Ym1pdCB0
aHJlYWQgb250byBhbGwgZ2wKICBkcml2ZXJzLgoKSXQgaXMgaG9ycmVuZG91cy4KLURhbmllbAoK
PiAKPiBDaHJpc3RpYW4uCj4gCj4gPiAKPiA+ICAgICBEYXZlLgo+ID4gCj4gCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
