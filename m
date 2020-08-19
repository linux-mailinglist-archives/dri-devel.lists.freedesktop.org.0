Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E8A24A0C2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 15:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D918925F;
	Wed, 19 Aug 2020 13:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53B189145;
 Wed, 19 Aug 2020 13:55:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r15so11715579wrp.13;
 Wed, 19 Aug 2020 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v556I+Zy6IwI/PTBMDpW1Ck4bj7FjQBNZ20dc1E+yYc=;
 b=Ir5wm/lRGSaS//BDPS40zsmFkDi9KK2mgw0R1P4vWjKn01NZttSd7XZaCte7LpIDwD
 kX7n4a13b46+h/Ws46Jgt7K9AWpkQBC0NoHN5XyuAiIDynwq4A2A4YqtsPWqmmfJfNhp
 0m8V/Ty572ukjCIbDX+Q4C2M7zNfB4Q5zXQ1tTbyqQWs92glJ9ddW1HO4sm/vKWsnFv8
 EsoWWr82QKhbVedRJvseOPaxMG8VRVWfjI1ezJqqFlvsmzlbcSZoxfILCBN1qQ92ONMn
 yH+5j/iHnGqHvQBBszj1UmIKBciCjPkaz5aVcaSoH1uYngAvAn7qfJj5gBj5H7LQDaA2
 X0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v556I+Zy6IwI/PTBMDpW1Ck4bj7FjQBNZ20dc1E+yYc=;
 b=IrysxVXyvLfqL631+8tDkFpAArNj8x/83qp/8ClPTLS/vPxiANFxLG3ys5HKhRa0Zs
 Q/KyuWsk2tjcIv2sfh888enJKzzVW0unArfqBGv7RJIXEpRY4sjqG8i92mT+XnGFjhjq
 YfXLnEPZJkFTtICvKAJPMy6IHGqBm8l3eUJtICWdLxrJJpT5JQce6C6N/WEwrNEI4We7
 S0H2VvO2zCZyq4i4CTix9SEyobnPJhNB2hzdJ3yNKojNUbXv07F57GzaxE0elq5sz/lj
 Djp8T2XhxTLQkit4nSkvmO9A+ProsyFBzPZ+vFiMwMsj+Ro9CCoXyJRw14yygd5JonV/
 rA4Q==
X-Gm-Message-State: AOAM532sGPFUvvzxKr/b+zALT6W68nB3SLFhRPiPz319s31p5dDIVB98
 bGK9Sdnlk4w1ITMkei8C/AxOVTPIKtlAjIz+EUE=
X-Google-Smtp-Source: ABdhPJydbGtYDV9E4ylZHWR7D6h8Pr8t2EIAq3FD8QXoe7+95xYqUBOHc2ySliWI1untuHAfvZeeTEdmnaFsSbC+s5A=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr26803359wrs.124.1597845346579; 
 Wed, 19 Aug 2020 06:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200722123813.721041-1-michel@daenzer.net>
 <CAKMK7uGO3K0P1yJsdT0urEXOVyBCU_Gsm8JaAW3R0TrBkueYNg@mail.gmail.com>
 <c1bed91c-aa9d-140e-701b-6946995cf24f@amd.com>
 <46b17209-09f6-d5a8-1335-0ff5371659f6@daenzer.net>
 <CADnq5_MWoNt5LR3-E8eMbXhXNFS_ccbqev+96BJphzzeKi16nw@mail.gmail.com>
 <c0fa93ad-021d-8fb1-3fd3-f0d223a90563@daenzer.net>
In-Reply-To: <c0fa93ad-021d-8fb1-3fd3-f0d223a90563@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Aug 2020 09:55:35 -0400
Message-ID: <CADnq5_M6XKPjiPOML6q1R532HApN8ry7gnA8Fghk0aOZX2E_XA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dc: Simplify drm_crtc_state::active checks
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTksIDIwMjAgYXQgNTowOCBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMDctMjIgNzoxMiBwLm0uLCBBbGV4IERldWNo
ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAyMiwgMjAyMCBhdCAxMDoyNSBBTSBNaWNoZWwgRMOk
bnplciA8bWljaGVsQGRhZW56ZXIubmV0PiB3cm90ZToKPiA+PiBPbiAyMDIwLTA3LTIyIDM6MTAg
cC5tLiwgS2F6bGF1c2thcywgTmljaG9sYXMgd3JvdGU6Cj4gPj4+IE9uIDIwMjAtMDctMjIgODo1
MSBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+Pj4gT24gV2VkLCBKdWwgMjIsIDIwMjAg
YXQgMjozOCBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0PiB3cm90ZToKPiA+
Pj4+Pgo+ID4+Pj4+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+
ID4+Pj4+Cj4gPj4+Pj4gZHJtX2F0b21pY19jcnRjX2NoZWNrIGVuZm9yY2VzIHRoYXQgOjphY3Rp
dmUgY2FuIG9ubHkgYmUgdHJ1ZSBpZgo+ID4+Pj4+IDo6ZW5hYmxlIGlzIGFzIHdlbGwuCj4gPj4+
Pj4KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0
LmNvbT4KPiA+Pj4KPiA+Pj4gTG9va3MgZmluZSB0byBtZS4gVGhlIGNoZWNrIGlzIHN1ZmZpY2ll
bnRseSBvbGQgZW5vdWdoIHRoYXQgSSBkb24ndCBtaW5kCj4gPj4+IHJlbHlpbmcgb24gdGhlIGNv
cmUgZm9yIHRoaXMgZWl0aGVyLgo+ID4+Pgo+ID4+PiBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6
bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+ID4+Pgo+ID4+Pj4KPiA+Pj4+
IG1vZGVzZXQgdnMgbW9kZXJlc2V0IGlzIGEgYml0IGFuIGluZ2xvcmlvdXMgbmFtZSBjaG9pY2Ug
Li4uIHNpbmNlIHRoaXMKPiA+Pj4+IHNlZW1zIHRvIGJlIGdsdWUgY29kZSBhbmQgbm90IHBhcnQg
b2YgY29yZSBkYywgbWF5YmUgcmVuYW1lIHRvCj4gPj4+PiBlbmFibGVfcmVxdWlyZWQvZGlzYWJs
ZV9yZXF1aXJlZCB0byBrZWVwIGl0IGNvbnNpc3RlbnQgd2l0aCB0aGUKPiA+Pj4+IHdvcmRpbmcg
YXRvbWljIGhlbHBlcnMgdXNlPyBEQyBhbHNvIHNlZW1zIHRvIHVzZSByZXNldCBmb3IgYSBsb3Qg
b2YKPiA+Pj4+IG90aGVyIHRoaW5ncyBhbHJlYWR5IChzdGF0ZSByZXNldCwgbGlrZSBhdG9taWMs
IG9yIGdwdSByZXNldCBsaWtlCj4gPj4+PiBkcm0vc2NoZWR1bGVyJ3MgdGRfcl8pLCBzbyBJIHRo
aW5rIHRoaXMgd291bGQgYWxzbyBoZWxwIGNsYXJpdHkgZnJvbSBhCj4gPj4+PiBEQyBwZXJzcGVj
dGl2ZS4KPiA+Pj4+Cj4gPj4+PiBQYXRjaCBpdHNlbGYgaXMgZ29vZCwgYWJvdmUganVzdCBhbiBp
ZGVhIGZvciBhbm90aGVyIHBhdGNoIG9uIHRvcC4KPiA+Pj4+Cj4gPj4+PiBSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+Pgo+ID4+IFRoYW5rcyBm
b3IgdGhlIHJldmlld3MhIEkgYXNzdW1lIHRoaXMgd2lsbCBnZXQgcGlja2VkIHVwIGJ5IGEgREMK
PiA+PiBkZXZlbG9wZXIgb3IgQWxleC9DaHJpc3RpYW4uCj4gPgo+ID4gQXBwbGllZC4gIFRoYW5r
cyEKPgo+IFRoYW5rIHlvdS4gQ2FuJ3Qgc2VlIGl0IGluIHRoZSBEUk0gY2hhbmdlcyBmb3IgNS45
IHRob3VnaC4KCldpbGwgc2hvdyB1cCBmb3IgNS4xMCBhcyBpdCBkaWRuJ3Qgc2VlbSBjcml0aWNh
bCBmb3IgNS45LgoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
