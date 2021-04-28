Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EDE36D52B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B0C6EAE2;
	Wed, 28 Apr 2021 09:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C99899B5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:57:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id x7so62317124wrw.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bz7ld1TMo3N1fnwryA6kiJiMahGShqDbFNXWCXaODME=;
 b=lGa4/KhgFCUVCDijv4LRBTP/mtkiRMl8u4RVJR2ifX2D9g3lxPjNv+R5iXwaMl2Qgb
 o3qlMyoKgFEODrXVe4RahW9mVCsmbDdlKHSHtOi5XlberojNaeBHofkFiXXuCThTSpu4
 6MDrXz0Sc3YdKx7bUFS2EYViRr2kJtzSD2kAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bz7ld1TMo3N1fnwryA6kiJiMahGShqDbFNXWCXaODME=;
 b=rtaxK60JM+wXCW8x4ufCEtrhvpXRmQnWafNoCTsjMmtlGJHUQ3OI1ZX2AFW7898l9f
 fidzURm3K5OheLEKGC/x2NxL4qwiPySQu2mSTNdEekvzAAJAVySw3GXjB2e8GiZwEDlN
 VjM44rnXwBiHGY9++fKugHyzKUCV8B5PDbbOeggzCWFJSuU7yZLSrdYzmHRgG3JYfLVy
 SPyMq31TQfFBbHCrqPUm4gubKA6bQ3X9hhsVIEjB6KVDDmOp8b9tepvvsQOD3P8+DtiM
 aec5RjwXNOlhGbJf26JQlrpKB9BewjmJwIiFymHbn6vhNdFnU9mbPtb8BynBvD7VA0Ja
 GjtA==
X-Gm-Message-State: AOAM5330R+1NX40XWDDs6vVYXQ5KdwT/yaaf/bjYo2FB53nmY1GrTAOr
 5eaDzbgOw+vBi115SIrwK5g9Kg==
X-Google-Smtp-Source: ABdhPJzvk+FXtmR56N1vNgCkE5Qm3b5qOZ6r1Ih9/+q+4hd5ezcIUCgC4llGlPgJwuGpf0YcPR51sw==
X-Received: by 2002:a05:6000:504:: with SMTP id
 a4mr35579869wrf.51.1619603841376; 
 Wed, 28 Apr 2021 02:57:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v20sm3284325wmj.15.2021.04.28.02.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 02:57:20 -0700 (PDT)
Date: Wed, 28 Apr 2021 11:57:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIkxf0nZXJrF8S61@phenom.ffwll.local>
References: <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
 <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
 <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
 <d6fbc1a3-ee69-d53e-0a60-9a313be19cac@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6fbc1a3-ee69-d53e-0a60-9a313be19cac@daenzer.net>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjgsIDIwMjEgYXQgMTE6MDc6MDlBTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAyMS0wNC0yOCA4OjU5IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4gPiBIaSBEYXZlLAo+ID4gCj4gPiBBbSAyNy4wNC4yMSB1bSAyMToyMyBzY2hyaWViIE1hcmVr
IE9sxaHDoWs6Cj4gPj4gU3VwcG9ydGluZyBpbnRlcm9wIHdpdGggYW55IGRldmljZSBpcyBhbHdh
eXMgcG9zc2libGUuIEl0IGRlcGVuZHMgb24gd2hpY2ggZHJpdmVycyB3ZSBuZWVkIHRvIGludGVy
b3BlcmF0ZSB3aXRoIGFuZCB1cGRhdGUgdGhlbS4gV2UndmUgYWxyZWFkeSBmb3VuZCB0aGUgcGF0
aCBmb3J3YXJkIGZvciBhbWRncHUuIFdlIGp1c3QgbmVlZCB0byBmaW5kIG91dCBob3cgbWFueSBv
dGhlciBkcml2ZXJzIG5lZWQgdG8gYmUgdXBkYXRlZCBhbmQgZXZhbHVhdGUgdGhlIGNvc3QvYmVu
ZWZpdCBhc3BlY3QuCj4gPj4KPiA+PiBNYXJlawo+ID4+Cj4gPj4gT24gVHVlLCBBcHIgMjcsIDIw
MjEgYXQgMjozOCBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20gPG1haWx0bzphaXJs
aWVkQGdtYWlsLmNvbT4+IHdyb3RlOgo+ID4+Cj4gPj4gICAgIE9uIFR1ZSwgMjcgQXByIDIwMjEg
YXQgMjI6MDYsIENocmlzdGlhbiBLw7ZuaWcKPiA+PiAgICAgPGNrb2VuaWcubGVpY2h0enVtZXJr
ZW5AZ21haWwuY29tIDxtYWlsdG86Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+PiB3
cm90ZToKPiA+PiAgICAgPgo+ID4+ICAgICA+IENvcnJlY3QsIHdlIHdvdWxkbid0IGhhdmUgc3lu
Y2hyb25pemF0aW9uIGJldHdlZW4gZGV2aWNlIHdpdGggYW5kIHdpdGhvdXQgdXNlciBxdWV1ZXMg
YW55IG1vcmUuCj4gPj4gICAgID4KPiA+PiAgICAgPiBUaGF0IGNvdWxkIG9ubHkgYmUgYSBwcm9i
bGVtIGZvciBBK0kgTGFwdG9wcy4KPiA+Pgo+ID4+ICAgICBTaW5jZSBJIHRoaW5rIHlvdSBtZW50
aW9uZWQgeW91J2Qgb25seSBiZSBlbmFibGluZyB0aGlzIG9uIG5ld2VyCj4gPj4gICAgIGNoaXBz
ZXRzLCB3b24ndCBpdCBiZSBhIHByb2JsZW0gZm9yIEErQSB3aGVyZSBvbmUgQSBpcyBhIGdlbmVy
YXRpb24KPiA+PiAgICAgYmVoaW5kIHRoZSBvdGhlcj8KPiA+Pgo+ID4gCj4gPiBDcmFwLCB0aGF0
IGlzIGEgZ29vZCBwb2ludCBhcyB3ZWxsLgo+ID4gCj4gPj4KPiA+PiAgICAgSSdtIG5vdCByZWFs
bHkgbGlraW5nIHdoZXJlIHRoaXMgaXMgZ29pbmcgYnR3LCBzZWVtcyBsaWtlIGEgaWxsCj4gPj4g
ICAgIHRob3VnaHQgb3V0IGNvbmNlcHQsIGlmIEFNRCBpcyByZWFsbHkgZ29pbmcgZG93biB0aGUg
cm9hZCBvZiBkZXNpZ25pbmcKPiA+PiAgICAgaHcgdGhhdCBpcyBjdXJyZW50bHkgTGludXggaW5j
b21wYXRpYmxlLCB5b3UgYXJlIGdvaW5nIHRvIGhhdmUgdG8KPiA+PiAgICAgYWNjZXB0IGEgYmln
IHBhcnQgb2YgdGhlIGJ1cmRlbiBpbiBicmluZ2luZyB0aGlzIHN1cHBvcnQgaW4gdG8gbW9yZQo+
ID4+ICAgICB0aGFuIGp1c3QgYW1kIGRyaXZlcnMgZm9yIHVwY29taW5nIGdlbmVyYXRpb25zIG9m
IGdwdS4KPiA+Pgo+ID4gCj4gPiBXZWxsIHdlIGRvbid0IHJlYWxseSBsaWtlIHRoYXQgZWl0aGVy
LCBidXQgd2UgaGF2ZSBubyBvdGhlciBvcHRpb24gYXMgZmFyIGFzIEkgY2FuIHNlZS4KPiAKPiBJ
IGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoYXQgImZ1dHVyZSBodyBtYXkgcmVtb3ZlIHN1cHBv
cnQgZm9yIGtlcm5lbAo+IHF1ZXVlcyIgbWVhbnMgZXhhY3RseS4gV2hpbGUgdGhlIHBlci1jb250
ZXh0IHF1ZXVlcyBjYW4gYmUgbWFwcGVkIHRvCj4gdXNlcnNwYWNlIGRpcmVjdGx5LCB0aGV5IGRv
bid0ICpoYXZlKiB0byBiZSwgZG8gdGhleT8gSS5lLiB0aGUga2VybmVsCj4gZHJpdmVyIHNob3Vs
ZCBiZSBhYmxlIHRvIGVpdGhlciBpbnRlcmNlcHQgdXNlcnNwYWNlIGFjY2VzcyB0byB0aGUKPiBx
dWV1ZXMsIG9yIGluIHRoZSB3b3JzdCBjYXNlIGRvIGl0IGFsbCBpdHNlbGYsIGFuZCBwcm92aWRl
IHRoZSBleGlzdGluZwo+IHN5bmNocm9uaXphdGlvbiBzZW1hbnRpY3MgYXMgbmVlZGVkPwo+IAo+
IFN1cmVseSB0aGVyZSBhcmUgcmVzb3VyY2UgbGltaXRzIGZvciB0aGUgcGVyLWNvbnRleHQgcXVl
dWVzLCBzbyB0aGUKPiBrZXJuZWwgZHJpdmVyIG5lZWRzIHRvIGRvIHNvbWUga2luZCBvZiB2aXJ0
dWFsaXphdGlvbiAvIG11bHRpLXBsZXhpbmcKPiBhbnl3YXksIG9yIHdlJ2xsIGdldCBzYWQgdXNl
ciBmYWNlcyB3aGVuIHRoZXJlJ3Mgbm8gcXVldWUgYXZhaWxhYmxlIGZvcgo+IDxjdXJyZW50IGhv
dCBnYW1lPi4KPiAKPiBJJ20gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcgdGhvdWdoLCBhd2Fp
dGluZyBlbmxpZ2h0ZW5tZW50LiA6KQoKWWVhaCBpbiBhbGwgdGhpcyBkaXNjdXNzaW9uIHdoYXQn
cyB1bmNsZWFyIHRvIG1lIGlzLCBpcyB0aGlzIGEgaGFyZCBhbWRncHUKcmVxdWlyZW1lbnQgZ29p
bmcgZm9yd2FyZCwgaW4gd2hpY2ggY2FzZSB5b3UgbmVlZCBhIHRpbWUgbWFjaGluZSBhbmQgbG90
cwpvZiBwZW9wbGUgdG8gcmV0cm9hY3RpdmVseSBmaXggdGhpcyBiZWNhdXNlIHRoaXMgYWludCBm
YXN0IHRvIGdldCBmaXhlZC4KCk9yIGlzIHRoaXMganVzdCBtdXNpbmdzIGZvciBhbiBlY29zeXN0
ZW0gdGhhdCBiZXR0ZXIgZml0cyBjdXJyZW50JmZ1dHVyZQpodywgZm9yIHdoaWNoIEkgdGhpbmsg
d2UgYWxsIGFncmVlIHdoZXJlIHRoZSByb3VnaCBkaXJlY3Rpb24gaXM/CgpUaGUgZm9ybWVyIGlz
IHF1aXRlIGEgZ2xvcmlvdXMgc2l0dWF0aW9uLCBhbmQgSSdtIHdpdGggRGF2ZSBoZXJlIHRoYXQg
aWYKeW91ciBodyBlbmdpbmVlcnMgcmVhbGx5IHJlbW92ZWQgdGhlIGJpdCB0byBub3QgbWFwIHRo
ZSByaW5nYnVmZmVycyB0bwp1c2Vyc3BhY2UsIHRoZW4gYW1kIGdldHMgdG8gZWF0IGEgYmlnIGNo
dW5rIG9mIHRoZSBjb3N0IGhlcmUuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
