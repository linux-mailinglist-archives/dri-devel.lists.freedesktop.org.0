Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A6D9612
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 17:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79BD8992E;
	Wed, 16 Oct 2019 15:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCAA898AF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 15:55:37 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id m7so8816006ywe.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hp6Fs/piYzflSkVpoCkyfOJHi0R/Uk5LfEqLH/Lk6zc=;
 b=n0qMcSPzbysTmgYGxIP4oxsJvUC5ysZjwDe3Dwlxb+7W7TSG2Uk494HhhfFxso77ND
 g6w+++Tk/FR/P7MsijaJmQPvqdBJFNXa1ES0c+iWnhrWU0SSZnXtIpsu/nvNKeSvG2e3
 HaI+1s6uCXQEN0RsszuI6KXFM4LhN3q2cEHFtOaaRVC8ZdDLBiiPwqWLwNSQ2589n2uk
 /9oIVn4KXoZbOC6fYAIANYlJsWM2HillZRGDBxJNpHyeL5h1DzqhcRHusiiKmkKR5LXd
 uDBrMC4rfJt3CO4O+2PO8gwSVLuOgORo//vBLsaSByxyCERoYuo3IAB1HIfhdlYOz5DS
 kFCg==
X-Gm-Message-State: APjAAAU4M3vTv2SVyOp11yYPpP5l0DCtQOwx5gAtaqzuWtJF50oBKUm5
 v2AjAXkS+XonEhVi29yJLMPrYg==
X-Google-Smtp-Source: APXvYqxztiITTRvp1rkkZFIgQCXq2QV79ojYWdjbLMgdd5Br1UWaMl5AEvv3scGKbqwOs6xpQUPIjg==
X-Received: by 2002:a81:9e06:: with SMTP id m6mr22131993ywj.391.1571241336812; 
 Wed, 16 Oct 2019 08:55:36 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id u69sm6778191ywu.93.2019.10.16.08.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 08:55:36 -0700 (PDT)
Date: Wed, 16 Oct 2019 11:55:35 -0400
From: Sean Paul <sean@poorly.run>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
Message-ID: <20191016155535.GX85762@art_vandelay>
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay>
 <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
 <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=hp6Fs/piYzflSkVpoCkyfOJHi0R/Uk5LfEqLH/Lk6zc=;
 b=X8bl2XajebiuwNcEMBkxljikQIM0xI+npxg+4UvqMhEgQzKMo4ZCd0mjuqAbdP/QzU
 hW1AUghCXEBPB0U0DJLmpNaRxBM0f2UlcN0983fzPK9C+1svfLsAWVRM+hmhembSeynK
 YTPQh6v9+8TBRtIiX2t8snVwcWI9TZa8i5Y3PXW3rR7fPMsiTZEoNxet4DIR7vdJ8oqx
 tGfVXSdI8Zzohj25C4nrVD9TeAdqJGndD/19Tc//Cw7Lmfl7qLwkbOfyH2h7eoKmQcLn
 hZGJYkeTryCZSVxgoNhGUkBrd8U4k5fMYsKiFT4X9ow5DLEgu0Pf89T8lZFheFk6wAg1
 MJAA==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDM6MjM6NDVQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxNi4xMC4xOSB1bSAxNTowNSBzY2hyaWViIFBla2thIFBh
YWxhbmVuOgo+ID4gT24gV2VkLCAxNiBPY3QgMjAxOSAwMDozNTozOSArMDIwMAo+ID4gRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPiAKPiA+PiBZZWFoIEkg
ZG9uJ3QgdGhpbmsgdHVuaW5nIHRoZSBzcGFtIGxldmVsIHdpbGwgZXZlciB3b3JrLiBXaGF0IHdl
IG5lZWQKPiA+PiBpcyBzb21lIGV4dGVybmFsIGlucHV0IChtb3N0IGxpa2VseSBmcm9tIHRoZSB1
c2VyIGNsaWNraW5nIHRoZSAibXkKPiA+PiBleHRlcm5hbCBzY3JlZW4gZG9lc24ndCB3b3JrIiBi
dXR0b24sIG9yIG1heWJlIHRoZSBjb21wb3NpdG9yCj4gPj4gcmVhbGl6aW5nIHNvbWV0aGluZyB0
aGF0IHNob3VsZCB3b3JrIGRpZG4ndCwgb3Igc29tZSBvdGhlciB0aGluZyB0aGF0Cj4gPj4gaW5k
aWNhdGVzIHRyb3VibGUpLCBhbmQgdGhlbiByZXRyb2FjdGl2ZWx5IGNhcHR1cmUgYWxsCj4gPj4g
ZGVidWcvaW5mb3JtYXRpb25hbCBtZXNzYWdlIGxlYWRpbmcgdXAgdG8gZG9vbS4KPiA+Pgo+ID4+
IEJ1dCB3aXRob3V0IHRoYXQgZXh0ZXJuYWwgImhvdXN0b24gd2UgaGF2ZSBhIHByb2JsZW0iIGlu
cHV0IGFsbCB0aGUKPiA+PiBkZWJ1ZyBzcGFtIGlzIHJlYWxseSBqdXN0IHNwYW0gYW5kIHVud2Fu
dGVkLiBidHcgZXZlbiBpZiB3ZSBkb24ndCBzcGFtCj4gPj4gZG1lc2cgaWYgd2UgZW5hYmxlIHRv
byBtdWNoIHdlIG1pZ2h0IGhhdmUgc2ltcGx5IHRyb3VibGUgd2l0aCBhbGwgdGhlCj4gPj4gcHJp
bnRrIGZvcm1hdHRpbmcgd29yayB3ZSBkbyBmb3Igbm90aGluZy4gU28gbWF5YmUgd2UgbmVlZCBz
b21ldGhpbmcKPiA+PiBsaWtlIHRyYWNlX3ByaW50ayB3aGljaCBpaXJjIGRlbGF5cyB0aGUgZm9y
bWF0dGluZyB1bnRpbCB0aGUgc3R1ZmYKPiA+PiBhY3R1YWxseSBnZXRzIHJlYWQgZnJvbSB0aGUg
bG9nIGJ1ZmZlci4gUGx1cyB0cmFjZV9wcmludGsgbWlnaHQgbWFrZQo+ID4+IGl0IGNsZWFyIGVu
b3VnaCB0aGF0IGl0J3Mgbm90IHN0YWJsZSB1YXBpIC4uLiBzbyBtYXliZSB3ZSBkbyB3YW50Cj4g
Pj4gdHJhY2VfcHJpbnRrIGluIHRoZSBlbmQ/Cj4gPj4KPiA+PiBKdXN0IG5vdCByZWFsbHkgbG9v
a2luZyBmb3J3YXJkIHRvIHJlaW1wbGVtZW50aW5nIGhhbGYgdGhlIHRyYWNpbmcKPiA+PiBpbmZy
YXN0cnVjdHVyZSBqdXN0IGZvciB0aGlzIC4uLgo+ID4gCj4gPiBIaSwKPiA+IAo+ID4gYSB0aG91
Z2h0IGFib3V0IHRoZSBVQVBJOgo+ID4gCj4gPiBEZWJ1Z2ZzIGlzIG5vdCBnb29kIGJlY2F1c2Ug
aXQncyBub3Qgc3VwcG9zZWQgdG8gYmUgdG91Y2hlZCBvciBldmVuCj4gPiBwcmVzZW50IGluIHBy
b2R1Y3Rpb24sIHJpZ2h0Pwo+IAo+IEknbSBydW5uaW5nIFR1bWJsZXdlZWQgd2hlcmUgZGVidWdm
cyBpcyBtb3VudGVkIGJ5IGRlZmF1bHQgZm9yIHJvb3QuIEkKPiBjb3VsZCBsaXZlIGhhdmluZyB0
aGUgdXNlciB0byBtb3VudCBkZWJ1Z2ZzIHRvIGdldCB0aGUgZmlsZSdzIGNvbnRlbnQuCj4gCj4g
PiBzcGVjaWZpY2FsbHkgYmUgYXZhaWxhYmxlIGluIHByb2R1Y3Rpb24uIFNvIGEgbmV3IGZpbGUg
aW4gc29tZSBmcwo+ID4gc29tZXdoZXJlIGl0IHNob3VsZCBiZSwgYW5kIHVzZXJzcGFjZSBpbiBw
cm9kdWN0aW9uIGNhbiByZWFkIGl0IGF0IHdpbGwKPiA+IHRvIGF0dGFjaCB0byBhIGJ1ZyByZXBv
cnQuCj4gPiAKPiA+IFRob3NlIHNlbWFudGljcywgIm9ubHkgdXNlIHRoaXMgY29udGVudCBmb3Ig
YXR0YWNoaW5nIGludG8gYSBidWcKPiA+IHJlcG9ydCIgc2hvdWxkIGJlIG1hZGUgdmVyeSBjbGVh
ciBpbiB0aGUgVUFQSS4KPiAKPiBIYXMgdGhpcyBldmVyIHdvcmtlZD8gQXMgc29vbiBhcyBhIHVz
ZXJzcGFjZSBwcm9ncmFtIHN0YXJ0cyBkZXBlbmRpbmcgb24KPiB0aGUgY29udGVudCBvZiB0aGlz
IGZpbGUsIGl0IGJlY29tZXMga2FiaS4gRnJvbSB0aGUgaW5jaWRlbnRzIEkga25vdywKPiBMaW51
cyBoYXMgYWx3YXlzIGJlZW4gcXVpdGUgc3RyaWN0IGFib3V0IHRoaXMuIEV2ZW4gZm9yIGJyb2tl
biBpbnRlcmZhY2VzLgo+IAoKSSB0aGluayBhdCB0aGlzIHBvaW50IEkndmUgY29udmluY2VkIG15
c2VsZiB0byBzcGVuZCB0aGUgdGltZSB0byBhZGQgcHJvcGVyCnN0YWJsZSBldmVudCB0cmFjZXMg
dG8gdGhlIGF0b21pYyBjb3JlICsgaGVscGVycyAoZHAvc2VsZiByZWZyZXNoL2hkY3AvZXRjKS4K
SXQncyBnb2luZyB0byBiZSBhIHBhaW4gKEkgcmVhbGx5IGhhdGUgaG93IG11Y2ggYm9pbGVycGxh
dGUgaXMgaW52b2x2ZWQgaW4KYWRkaW5nIGp1c3Qgb25lIGV2ZW50KSwgYnV0IEkgdGhpbmsgdGhl
cmUncyBlbm91Z2ggaW50ZXJlc3QgdGhhdCBpdCdsbCBiZQp3b3J0aCBpdC4KCklmIGl0IHR1cm5z
IG91dCB0byBiZSB1c2VmdWwsIHdlIGNhbiBkaWcgaW50byBzb21lIG9mIHRoZSBkcml2ZXJzIGFz
IHdlbGwuCgpTZWFuCgo+ID4gSSBiZWxpZXZlIGl0IGhhcyB0byBiZSBhIHJpbmcgYnVmZmVyIHRo
YXQgaXMgYmVpbmcgY29udGludW91c2x5IHdyaXR0ZW4KPiA+IGFsc28gZHVyaW5nIG5vcm1hbCBv
cGVyYXRpb25zLCBzbyB0aGF0IHdlIGRvbid0IGhhdmUgdG8gYXNrIGVuZCB1c2Vycwo+ID4gdG8g
cmVwcm9kdWNlIHRoZSBpc3N1ZSBhZ2FpbiBqdXN0IHRvIGdldCBzb21lIGxvZ3MuIE1heWJlIHRo
ZSBpc3N1ZQo+ID4gaGFwcGVucyBvbmNlIGluIGEgZm9ydG5pZ2h0LiBUaGUgaW5mb3JtYXRpb24g
bXVzdCBiZSBleHRyYWN0YWJsZSBhZnRlcgo+ID4gdGhlIGZhY3QsIHdpdGhvdXQgYmVmb3JlLWhh
bmQgcHJlcGFyYXRpb25zLgo+IAo+IEFncmVlZC4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMK
PiAKPiA+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBwcQo+ID4gCj4gCj4gLS0gCj4gVGhvbWFzIFpp
bW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxp
eCBJbWVuZMO2cmZmZXIKPiAKCgoKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
