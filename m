Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF12B861
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 17:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63B889ACC;
	Mon, 27 May 2019 15:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8043F89AC9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 15:26:56 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w9so12129249oic.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 08:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oVufzcJHvG8iTpmag68ZfpvkusdfoXyKMYfPqO/hjZg=;
 b=i+J/Z0bQipXlqAfcZDI9WJ4gpE+csv5jk0SQdx3/m6BUm7/N51cPPH8FgI0OcO0jjb
 hMoGiUriPjYb11IXBryPjaOeefs3/sv7p4QE+CHYQUjKluuvBg6ZtMtGJQIMU8JiFMtI
 hQT+sC3Q7UzRdVPts8NFOEPUXBXdAo7rFMciG0p6hwvcqhIZyonvPypwxcykRbLNOw0z
 jESLMBj6yAnp9i9pNle8WQekD3QJzhMI5K6Iji7z7b6KRZXE81FJrUtRVuXeqAZwXMsD
 xVC0pYHRHAjIiisuUlGCyHCl/PDlILSCeO5lMksHkqKwuz5XtWZSERmqo9qW9jDCoSEe
 BJSg==
X-Gm-Message-State: APjAAAULf3j2IhDdIGKHRq+Y6sguOqdCPeRGy1kZyr87ahPzdWVGnLl0
 J1anHfns+NF2LbaJytv600UiqMO4x3dZfRwtbTmAsg==
X-Google-Smtp-Source: APXvYqyysn2WeOdIqKrO4RpxJVsX/2lbnow732BnKY9KzIxtWxxr2IWIiarxWyrjoITWI08vtjqSGpp/TXc8bC9AXqQ=
X-Received: by 2002:aca:31cf:: with SMTP id
 x198mr14553485oix.132.1558970815746; 
 Mon, 27 May 2019 08:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527132041.GP21222@phenom.ffwll.local>
 <20190527132607.GH15067@arch-x1c3>
 <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
In-Reply-To: <0426fb3e-e7bc-2464-cb42-4d5753956d23@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 27 May 2019 17:26:44 +0200
Message-ID: <CAKMK7uE_pRro8PxTwUq+pC_1GVVT7nUxan1T-kqSYT=BMHTf2g@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oVufzcJHvG8iTpmag68ZfpvkusdfoXyKMYfPqO/hjZg=;
 b=e/TzQM7ZtVHKMLCKxbQAr+qWGjcfbzt4PlsXzgmVH/8GSbcvR5sBw3KlE/TfTlakAv
 ajt+kdfPwvgVp5mv/j3UMKyWhadxgnQ9rDJIx3WzQ/RkZ3rMedZERKtKkiwn49Kqcj8r
 p1gqQgLj+8Fjh5fLDXbxWYoeLZ6Yl52hqerSI=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMzo0MiBQTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI3LjA1LjE5IHVtIDE1OjI2IHNjaHJp
ZWIgRW1pbCBWZWxpa292Ogo+ID4gT24gMjAxOS8wNS8yNywgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+PiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAxMDo0NzozOUFNICswMDAwLCBLb2VuaWcsIENo
cmlzdGlhbiB3cm90ZToKPiA+Pj4gQW0gMjcuMDUuMTkgdW0gMTA6MTcgc2NocmllYiBFbWlsIFZl
bGlrb3Y6Cj4gPj4+PiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgo+ID4+Pj4KPiA+Pj4+IEN1cnJlbnRseSBvbmUgY2FuIGNpcmN1bXZlbnQgRFJNX0FVVEgs
IHdoZW4gdGhlIGlvY3RsIGlzIGV4cG9zZWQgdmlhIHRoZQo+ID4+Pj4gcmVuZGVyIG5vZGUuIEEg
c2VlbWluZ2x5IGRlbGliZXJhdGUgZGVzaWduIGRlY2lzaW9uLgo+ID4+Pj4KPiA+Pj4+IEhlbmNl
IHdlIGNhbiBkcm9wIHRoZSBEUk1fQVVUSCBhbGwgdG9nZXRoZXIgKGRldGFpbHMgaW4gZm9sbG93
LXVwIHBhdGNoKQo+ID4+Pj4geWV0IG5vdCBhbGwgdXNlcnNwYWNlIGNoZWNrcyBpZiBpdCdzIGF1
dGhlbnRpY2F0ZWQsIGJ1dCBpbnN0ZWFkIHVzZXMKPiA+Pj4+IHVuY29tbW9uIGFzc3VtcHRpb25z
Lgo+ID4+Pj4KPiA+Pj4+IEFmdGVyIGRheXMgb2YgZGlnZ2luZyB0aHJvdWdoIGdpdCBsb2cgYW5k
IHRlc3RpbmcsIG9ubHkgYSBzaW5nbGUgKGFiKXVzZQo+ID4+Pj4gd2FzIHNwb3R0ZWQgLSB0aGUg
TWVzYSBSQURWIGRyaXZlciwgdXNpbmcgdGhlIEFNREdQVV9JTkZPIGlvY3RsIGFuZAo+ID4+Pj4g
YXNzdW1pbmcgdGhhdCBmYWlsdXJlIGltcGxpZXMgbGFjayBvZiBhdXRoZW50aWNhdGlvbi4KPiA+
Pj4+Cj4gPj4+PiBBZmZlY3RlZCB2ZXJzaW9ucyBhcmU6Cj4gPj4+PiAgICAtIHRoZSB3aG9sZSAx
OC4yLnggc2VyaWVzLCB3aGljaCBpcyBFT0wKPiA+Pj4+ICAgIC0gdGhlIHdob2xlIDE4LjMueCBz
ZXJpZXMsIHdoaWNoIGlzIEVPTAo+ID4+Pj4gICAgLSB0aGUgMTkuMC54IHNlcmllcywgcHJpb3Ig
dG8gMTkuMC40Cj4gPj4+IFdlbGwgeW91IGNvdWxkIGhhdmUgc2F2ZWQgeW91ciB0aW1lLCBjYXVz
ZSB0aGlzIGlzIHN0aWxsIGEgTkFLLgo+ID4+Pgo+ID4+PiBGb3IgdGhlIHJlY29yZDogSSBzdHJv
bmdseSB0aGluayB0aGF0IHdlIGRvbid0IHdhbnQgdG8gZXhwb3NlIGFueSByZW5kZXIKPiA+Pj4g
ZnVuY3Rpb25hbGl0eSBvbiB0aGUgcHJpbWFyeSBub2RlLgo+ID4+Pgo+ID4+PiBUbyBldmVuIGdv
IGEgc3RlcCBmdXJ0aGVyIEkgd291bGQgc2F5IHRoYXQgYXQgbGVhc3Qgb24gQU1EIGhhcmR3YXJl
IHdlCj4gPj4+IHNob3VsZCBjb21wbGV0ZWx5IGRpc2FibGUgRFJJMiBmb3Igb25lIG9mIHRoZSBu
ZXh0IGdlbmVyYXRpb25zLgo+ID4+Pgo+ID4+PiBBcyBhIGZvbGxvdyB1cCBJIHdvdWxkIHRoZW4g
Y29tcGxldGVseSBkaXNhbGxvdyB0aGUgRFJNIGF1dGhlbnRpY2F0aW9uCj4gPj4+IGZvciBhbWRn
cHUsIHNvIHRoYXQgdGhlIGNvbW1hbmQgc3VibWlzc2lvbiBpbnRlcmZhY2Ugb24gdGhlIHByaW1h
cnkgbm9kZQo+ID4+PiBjYW4gb25seSBiZSB1c2VkIGJ5IHRoZSBkaXNwbGF5IHNlcnZlci4KPiA+
PiBTbyBhbWRncHUgaXMgcnVubmluZyBpbiBvbmUgZGlyZWN0aW9uLCB3aGlsZSBldmVyeW9uZSBl
bHNlIGlzIHJ1bm5pbmcgaW4KPiA+PiB0aGUgb3RoZXIgZGlyZWN0aW9uPyBQbGVhc2Ugbm90ZSB0
aGF0IHlvdXIgcGF0Y2ggdG8gY2hhbmdlIGk5MTUgbGFuZGVkCj4gPj4gYWxyZWFkeSwgc28gdGhh
dCBzaGlwIGlzIHNhaWxpbmcgKGJ1dCB3ZSBjb3VsZCBvZmMgcmV2ZXJ0IHRoYXQgYmFjawo+ID4+
IGFnYWluKS4KPiA+Pgo+ID4+IEltbyByZWFsbHkgbm90IGEgZ3JlYXQgaWRlYSBpZiB3ZSBkbyBh
IGFtZGdwdSB2cy4gZXZlcnlvbmUgZWxzZSBzcGxpdAo+ID4+IGhlcmUuIElmIHdlIHdhbnQgdG8g
ZGVwcmVjYXRlIGRyaTIvZmxpbmsvcmVuZGVyaW5nIG9uIHByaW1hcnkgbm9kZXMgYWNyb3NzCj4g
Pj4gdGhlIHN0YWNrLCB0aGVuIHRoYXQgc2hvdWxkIGJlIGEgc3RhY2sgd2lkZSBkZWNpc2lvbiwg
bm90IGFuIGFtZGdwdSBvbmUuCj4gPj4KPiA+IENhbm5vdCBhZ3JlZSBtb3JlIC0gSSB3b3VsZCBs
b3ZlIHRvIHNlZSBkcml2ZXJzIHN0YXkgY29uc2lzdGVudC4KPgo+IFllYWgsIGNvbXBsZXRlbHkg
YWdyZWUgdG8gdGhhdC4gVGhhdCdzIHdoeSBJIHRoaW5rIHdlIHNob3VsZCBub3QgZG8gdGhpcwo+
IGF0IGFsbCBhbmQganVzdCBsZXQgSW50ZWwgZml4IGl0J3MgdXNlcnNwYWNlIGJ1Z3MgOlAKClNv
IHlvdSdyZSBwbGFubmluZyB0byBzdWJtaXQgdGhhdCByZXZlcnQ/IFlvdSBkaWQganVtcCB0aGUg
Z3VuIHdpdGgKc2VuZGluZyBvdXQgdGhhdCBwYXRjaCBhZnRlciBhbGwgdG9vIC4uLiAoYXNpZGUg
ZnJvbSBpdCBnb3QgbWVyZ2VkCmJlY2F1c2Ugb2Ygc29tZSBvdGhlciBtaXh1cCB3aXRoIHItYiB0
YWdzIGFuZCB3aGF0IG5vdCkuCi1EYW5pZWwKCj4gQW55d2F5IG15IGNvbmNlcm4gaXMgcmVhbGx5
IHRoYXQgd2Ugc2hvdWxkIHN0b3AgZXh0ZW5kaW5nIGZ1bmN0aW9uYWxpdHkKPiBvbiB0aGUgcHJp
bWFyeSBub2RlLgo+Cj4gRS5nLiB0aGUgcmVuZGVyIG5vZGUgaXMgZm9yIHVzZSBieSB0aGUgY2xp
ZW50cyBhbmQgdGhlIHByaW1hcnkgbm9kZSBmb3IKPiBtb2RlIHNldHRpbmcgYW5kIHVzZSBieSB0
aGUgZGlzcGxheSBzZXJ2ZXIgb25seS4KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4gPiBG
d2l3LCB0aGlzIHNlcmllcyBjb25zaXN0ZW50bHkgcGF2ZXMgdGhlIHdheSB0b3dhcmQgbnVraW5n
IERSTV9BVVRIIDstKQo+ID4KPiA+IFRoYW5rcwo+ID4gRW1pbAo+CgoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3
IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
