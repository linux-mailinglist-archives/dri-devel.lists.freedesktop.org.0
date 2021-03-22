Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B7344C96
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 18:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F64888AA0;
	Mon, 22 Mar 2021 17:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5DB89BBE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 17:02:21 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso16639061ott.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ow15AyWWo9pzUtxBqr+0MCCuYbydO4LdQhm9i3QGpOM=;
 b=dI7hYScDvigTwHtnohhjBIkI+bbfsi+Y2Y+9caiaj//FDbAxuUSCpm9gRDaf8zljKm
 71pVR2Pz3wtFVEaXAbURSrcU/s0RCBSUaq4bo5J7Tfp3fweChjof8y7euCz+rLDUpC1q
 r18gWi3zea3/27yRw2CERPn9Z8m11UuoYsImQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ow15AyWWo9pzUtxBqr+0MCCuYbydO4LdQhm9i3QGpOM=;
 b=dyFcBHXHEMZfOotArg1CGAnEJgqS4PBMj2e47CTuk05w2ZPMX4H6+01bV5li7imp3S
 +GabYMa6x05mOQztXfXNxBEzosu0KTBiz1axu9LslgQoAuzdn01B3Q1rZPlyLLv7LPO9
 MUY2tJZRF07BDGyKJ/O/OKDdkQSz9Ml4PESzMReksJG02IZnnOglm88cXnw+K3WDe+9Z
 rEp5n5RlNhfHsOSPGchOXujamBoPO+WPk57tU0P5d7vXX5+gjq7utNv3qJ7+7VL0KSQ5
 8xC+NtYVri/IjiJ0t/SgyXir66KQ4+5nAEkwGbHFVTUl57f/P75nqSmmdNTGdn/GSUId
 Vecg==
X-Gm-Message-State: AOAM533TByGwASCsPKrLI6+9MKW+2BU7xmQy5vHIIqH9YvFYIXAiGUBC
 sjH0yf9u62dq8wA0ywpNuOAA165CDBts0HRAGVJ8bw==
X-Google-Smtp-Source: ABdhPJxMfkDJpJLIrH9tErjhqT3yLQM23cMXRDpi+Efl0HlYE7pmL8by9hDnkLUCk7IIm3o2Ax9TDOCwl9aeIlW724c=
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr715495oto.281.1616432540363; 
 Mon, 22 Mar 2021 10:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210319140857.2262-1-christian.koenig@amd.com>
 <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
 <2831bfcc-140e-dade-1f50-a6431e495e9d@gmail.com>
 <YFT2LSR97rkkPyEP@phenom.ffwll.local>
 <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
 <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
In-Reply-To: <YFi+UROYbQERYEEr@dhcp22.suse.cz>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 22 Mar 2021 18:02:09 +0100
Message-ID: <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Michal Hocko <mhocko@suse.com>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgNTowNiBQTSBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24gMjItMDMtMjEgMTQ6MDU6NDgsIE1hdHRoZXcgV2lsY294
IHdyb3RlOgo+ID4gT24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDI6NDk6MjdQTSArMDEwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gU3VuLCBNYXIgMjEsIDIwMjEgYXQgMDM6MTg6MjhQ
TSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiBBbSAyMC4wMy4yMSB1bSAx
NDoxNyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+ID4gPiBPbiBTYXQsIE1hciAyMCwgMjAy
MSBhdCAxMDowNCBBTSBDaHJpc3RpYW4gS8O2bmlnCj4gPiA+ID4gPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiBBbSAxOS4wMy4yMSB1bSAyMDow
NiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+ID4gPiA+ID4gT24gRnJpLCBNYXIgMTksIDIw
MjEgYXQgMDc6NTM6NDhQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiA+
ID4gPiA+IEFtIDE5LjAzLjIxIHVtIDE4OjUyIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+ID4g
PiA+ID4gPiA+ID4gT24gRnJpLCBNYXIgMTksIDIwMjEgYXQgMDM6MDg6NTdQTSArMDEwMCwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiBEb24ndCBwcmludCBhIHdh
cm5pbmcgd2hlbiB3ZSBmYWlsIHRvIGFsbG9jYXRlIGEgcGFnZSBmb3Igc3dhcHBpbmcgdGhpbmdz
IG91dC4KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IEFsc28gcmVseSBv
biBtZW1hbGxvY19ub2ZzX3NhdmUvbWVtYWxsb2Nfbm9mc19yZXN0b3JlIGluc3RlYWQgb2YgR0ZQ
X05PRlMuCj4gPiA+ID4gPiA+ID4gPiA+IFVoIHRoaXMgcGFydCBkb2Vzbid0IG1ha2Ugc2Vuc2Uu
IEVzcGVjaWFsbHkgc2luY2UgeW91IG9ubHkgZG8gaXQgZm9yIHRoZQo+ID4gPiA+ID4gPiA+ID4g
PiBkZWJ1Z2ZzIGZpbGUsIG5vdCBpbiBnZW5lcmFsLiBXaGljaCBtZWFucyB5b3UndmUganVzdCBj
b21wbGV0ZWx5IGJyb2tlbgo+ID4gPiA+ID4gPiA+ID4gPiB0aGUgc2hyaW5rZXIuCj4gPiA+ID4g
PiA+ID4gPiBBcmUgeW91IHN1cmU/IE15IGltcHJlc3Npb24gaXMgdGhhdCBHRlBfTk9GUyBzaG91
bGQgbm93IHdvcmsgbXVjaCBtb3JlIG91dAo+ID4gPiA+ID4gPiA+ID4gb2YgdGhlIGJveCB3aXRo
IHRoZSBtZW1hbGxvY19ub2ZzX3NhdmUoKS9tZW1hbGxvY19ub2ZzX3Jlc3RvcmUoKS4KPiA+ID4g
PiA+ID4gPiBZZWFoLCBpZiB5b3UnZCBwdXQgaXQgaW4gdGhlIHJpZ2h0IHBsYWNlIDotKQo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQnV0IGFsc28gLW1tIGZvbGtzIGFyZSB2ZXJ5IGNsZWFy
IHRoYXQgbWVtYWxsb2Nfbm8qKCkgZmFtaWx5IGlzIGZvciBkaXJlCj4gPiA+ID4gPiA+ID4gc2l0
dWF0aW9uIHdoZXJlIHRoZXJlJ3MgcmVhbGx5IG5vIG90aGVyIHdheSBvdXQuIEZvciBhbnl0aGlu
ZyB3aGVyZSB5b3UKPiA+ID4gPiA+ID4gPiBrbm93IHdoYXQgeW91J3JlIGRvaW5nLCB5b3UgcmVh
bGx5IHNob3VsZCB1c2UgZXhwbGljaXQgZ2ZwIGZsYWdzLgo+ID4gPiA+ID4gPiBNeSBpbXByZXNz
aW9uIGlzIGp1c3QgdGhlIG90aGVyIHdheSBhcm91bmQuIFlvdSBzaG91bGQgdHJ5IHRvIGF2b2lk
IHRoZQo+ID4gPiA+ID4gPiBOT0ZTL05PSU8gZmxhZ3MgYW5kIHVzZSB0aGUgbWVtYWxsb2Nfbm8q
IGFwcHJvYWNoIGluc3RlYWQuCj4gPiA+ID4gPiBXaGVyZSBkaWQgeW91IGdldCB0aGF0IGlkZWE/
Cj4gPiA+ID4KPiA+ID4gPiBXZWxsIGZyb20gdGhlIGtlcm5lbCBjb21tZW50IG9uIEdGUF9OT0ZT
Ogo+ID4gPiA+Cj4gPiA+ID4gICogJUdGUF9OT0ZTIHdpbGwgdXNlIGRpcmVjdCByZWNsYWltIGJ1
dCB3aWxsIG5vdCB1c2UgYW55IGZpbGVzeXN0ZW0KPiA+ID4gPiBpbnRlcmZhY2VzLgo+ID4gPiA+
ICAqIFBsZWFzZSB0cnkgdG8gYXZvaWQgdXNpbmcgdGhpcyBmbGFnIGRpcmVjdGx5IGFuZCBpbnN0
ZWFkIHVzZQo+ID4gPiA+ICAqIG1lbWFsbG9jX25vZnNfe3NhdmUscmVzdG9yZX0gdG8gbWFyayB0
aGUgd2hvbGUgc2NvcGUgd2hpY2gKPiA+ID4gPiBjYW5ub3Qvc2hvdWxkbid0Cj4gPiA+ID4gICog
cmVjdXJzZSBpbnRvIHRoZSBGUyBsYXllciB3aXRoIGEgc2hvcnQgZXhwbGFuYXRpb24gd2h5LiBB
bGwgYWxsb2NhdGlvbgo+ID4gPiA+ICAqIHJlcXVlc3RzIHdpbGwgaW5oZXJpdCBHRlBfTk9GUyBp
bXBsaWNpdGx5Lgo+ID4gPgo+ID4gPiBIdWggdGhhdCdzIGludGVyZXN0aW5nLCBzaW5jZSBpaXJj
IFdpbGx5IG9yIERhdmUgdG9sZCBtZSB0aGUgb3Bwb3NpdGUsIGFuZAo+ID4gPiB0aGUgbWVtYWxs
b2Nfbm8qIHN0dWZmIGlzIGZvciBlLmcuIG5mcyBjYWxsaW5nIGludG8gbmV0d29yayBsYXllciAo
bmVlZHMKPiA+ID4gR0ZQX05PRlMpIG9yIHN3YXAgb24gdG9wIG9mIGEgZmlsZXN5c3RlbXMgKGV2
ZW4gbmVlZHMgR0ZQX05PSU8gSSB0aGluaykuCj4gPiA+Cj4gPiA+IEFkZGluZyB0aGVtLCBtYXli
ZSBJIGdvdCBjb25mdXNlZC4KPiA+Cj4gPiBNeSBpbXByZXNzaW9uIGlzIHRoYXQgdGhlIHNjb3Bl
ZCBBUEkgaXMgcHJlZmVycmVkIHRoZXNlIGRheXMuCj4gPgo+ID4gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC9sYXRlc3QvY29yZS1hcGkvZ2ZwX21hc2stZnJvbS1mcy1pby5odG1sCj4g
Pgo+ID4gSSdkIHByb2JhYmx5IG5lZWQgdG8gc3BlbmQgYSBmZXcgbW9udGhzIGxlYXJuaW5nIHRo
ZSBEUk0gc3Vic3lzdGVtIHRvCj4gPiBoYXZlIGEgbW9yZSBkZXRhaWxlZCBvcGluaW9uIG9uIHdo
ZXRoZXIgcGFzc2luZyBHRlAgZmxhZ3MgYXJvdW5kIGV4cGxpY2l0bHkKPiA+IG9yIHVzaW5nIHRo
ZSBzY29wZSBBUEkgaXMgdGhlIGJldHRlciBhcHByb2FjaCBmb3IgeW91ciBzaXR1YXRpb24uCj4K
PiB5ZXMsIGluIGFuIGlkZWFsIHdvcmxkIHdlIHdvdWxkIGhhdmUgYSBjbGVhcmx5IGRlZmluZWQg
c2NvcGUgb2YgdGhlCj4gcmVjbGFpbSByZWN1cnNpb24gd3J0IEZTL0lPIGFzc29jaWF0ZWQgd2l0
aCBpdC4gSSd2ZSBnb3QgYmFjayB0bwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FtZC1nZngv
MjAyMTAzMTkxNDA4NTcuMjI2Mi0xLWNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbS8KPiBhbmQgdGhl
cmUgYXJlIHR3byB0aGluZ3Mgc3RhbmRpbmcgb3V0LiBXaHkgZG9lcyB0dG1fdHRfZGVidWdmc19z
aHJpbmtfc2hvdwo+IHJlYWxseSByZXF1aXJlIE5PRlMgc2VtYW50aWM/IEFuZCB3aHkgZG9lcyBp
dCBwbGF5IHdpdGgKPiBmc19yZWNsYWltX2FjcXVpcmU/CgpJdCdzIG91ciBzaHJpbmtlci4gc2hy
aW5rX3Nob3cgc2ltcGx5IHRyaWdnZXJzIHRoYXQgc3BlY2lmaWMgc2hyaW5rZXIKYXNraW5nIGl0
IHRvIHNocmluayBldmVyeXRoaW5nIGl0IGNhbiwgd2hpY2ggaGVscHMgYSBsb3Qgd2l0aCB0ZXN0
aW5nCndpdGhvdXQgaGF2aW5nIHRvIGRyaXZlIHRoZSBlbnRpcmUgc3lzdGVtIGFnYWluc3QgdGhl
IE9PTSB3YWxsLgpmc19yZWNsYWltX2FjcXVpcmUgaXMgdGhlcmUgdG8gbWFrZSBzdXJlIGxvY2tk
ZXAgdW5kZXJzdGFuZHMgdGhhdCB0aGlzCmlzIGEgc2hyaW5rZXIgYW5kIHRoYXQgaXQgY2hlY2tz
IGFsbCB0aGUgZGVwZW5kZW5jaWVzIGZvciB1cyBsaWtlIGlmCndlJ2QgYmUgaW4gcmVhbCByZWNs
YWltLiBUaGVyZSBpcyBzb21lIGRyb3AgY2FjaGVzIGludGVyZmFjZXMgaW4gcHJvYwppaXJjLCBi
dXQgdGhvc2UgZHJvcCBldmVyeXRoaW5nLCBhbmQgdGhleSBkb24ndCBoYXZlIHRoZSBmc19yZWNs
YWltCmFubm90YXRpb25zIHRvIHRlYWNoIGxvY2tkZXAgYWJvdXQgd2hhdCB3ZSdyZSBkb2luZy4K
LURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
