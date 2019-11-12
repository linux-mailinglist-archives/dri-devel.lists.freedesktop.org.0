Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6187F8BEE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 10:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA2E6EACF;
	Tue, 12 Nov 2019 09:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051376EACF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:35:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z26so2280467wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 01:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=YxWwDwoWUKwxhOddOYjlkdGFUnUKxIpcYuG1fsi83Eg=;
 b=iZUpBE0vb7Cy5SOsNKZSXLTSvh81zrMgc+dKAVTl5Khz8cgXmE+wBqVmVXvJE5F9qL
 1xp9Aho8N+mugpTsXAHorThRpD5Y3FH7oCfyqxSYLUie0s9Uh7NOZWejg0FGROiNHNJH
 bLEPCmP0O9S9AHuTh9xhZ1dQg4Fg64KAn6kdND243CumqtfDpPYfLCocVXl9UxK2qsxe
 ylS9DJxti655PwfbhR+9FJgALEkPkC+ILC4frPfVxD1mn+P2rcaflqMzZeLXaoIewQYI
 2bCGRMQXETqfvl7KP4GME8LDDAYvqAU+2EtHuVC9BR3Li+Fmgm4N9jw5FacZ6ttzp685
 n3dw==
X-Gm-Message-State: APjAAAUldmzlEwEynRRc8SNvNAgua+XkqPQCoPAUjBTEM+B7mOdsjnaa
 ffxroR3zsddnaWLZEHRuyLyWIg==
X-Google-Smtp-Source: APXvYqwa7+6gioYBF8Ode31tBzdyPwV4kTBpRDEODb0JMiTA5m7z0DsZjjdMQs2tycdNSoiXDzNiHw==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr3254442wmi.124.1573551320560; 
 Tue, 12 Nov 2019 01:35:20 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q15sm10594918wrs.91.2019.11.12.01.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 01:35:19 -0800 (PST)
Date: Tue, 12 Nov 2019 10:35:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191112093518.GE23790@phenom.ffwll.local>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <20191108165528.GC23790@phenom.ffwll.local>
 <20191112085254.nzemljr3co4l5k2e@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112085254.nzemljr3co4l5k2e@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YxWwDwoWUKwxhOddOYjlkdGFUnUKxIpcYuG1fsi83Eg=;
 b=NSB1GyO8qxsBtVLej/GZIy/VAVi261l9bAx50hH/gHeHfKQBqKsRo8fsKZhdKgkjql
 r+TQhOZ2gHS5ErCqoqhsIj7EDxrwRiF3DmP651fYFrJHEoCt7zjkbA6HL0su/CL91Ncq
 imByJbGYpsyd2m7lYFiCFy1dcw38grT6E2LkM=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDk6NTI6NTRBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBGcmksIE5vdiAwOCwgMjAxOSBhdCAwNTo1NToyOFBNICswMTAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDU6Mjc6NTlQTSArMDEw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDk6
MzA6NDJBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE9jdCAy
NCwgMjAxOSBhdCAwMjoxODo1OVBNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gPiA+
IENvbW1pdCBjNDAwNjljYjdiZDYgKCJkcm06IGFkZCBtbWFwKCkgdG8gZHJtX2dlbV9vYmplY3Rf
ZnVuY3MiKQo+ID4gPiA+ID4gaW50cm9kdWNlZCBhIEdFTSBvYmplY3QgbW1hcCgpIGhvb2sgd2hp
Y2ggaXMgZXhwZWN0ZWQgdG8gc3VidHJhY3QgdGhlCj4gPiA+ID4gPiBmYWtlIG9mZnNldCBmcm9t
IHZtX3Bnb2ZmLiBIb3dldmVyLCBmb3IgbW1hcCgpIG9uIGRtYWJ1ZnMsIHRoZXJlIGlzIG5vdAo+
ID4gPiA+ID4gYSBmYWtlIG9mZnNldC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVG8gZml4IHRoaXMs
IGxldCdzIGFsd2F5cyBjYWxsIG1tYXAoKSBvYmplY3QgY2FsbGJhY2sgd2l0aCBhbiBvZmZzZXQg
b2YgMCwKPiA+ID4gPiA+IGFuZCBsZWF2ZSBpdCB1cCB0byBkcm1fZ2VtX21tYXBfb2JqKCkgdG8g
cmVtb3ZlIHRoZSBmYWtlIG9mZnNldC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVFRNIHN0aWxsIG5l
ZWRzIHRoZSBmYWtlIG9mZnNldCwgc28gd2UgaGF2ZSB0byBhZGQgaXQgYmFjayB1bnRpbCB0aGF0
J3MKPiA+ID4gPiA+IGZpeGVkLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGaXhlczogYzQwMDY5Y2I3
YmQ2ICgiZHJtOiBhZGQgbW1hcCgpIHRvIGRybV9nZW1fb2JqZWN0X2Z1bmNzIikKPiA+ID4gPiA+
IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+ID4gPiA+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
djI6Cj4gPiA+ID4gPiAtIE1vdmUgc3VidHJhY3RpbmcgdGhlIGZha2Ugb2Zmc2V0IG91dCBvZiBt
bWFwKCkgb2JqIGNhbGxiYWNrcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSd2ZSB0ZXN0ZWQgc2ht
ZW0sIGJ1dCBub3QgdHRtLiBIb3BlZnVsbHksIEkgdW5kZXJzdG9vZCB3aGF0J3MgbmVlZGVkIAo+
ID4gPiA+ID4gZm9yIFRUTS4KPiA+ID4gCj4gPiA+IFNvIHVuZm9ydHVuYXRlbHkgSSdtIGFscmVh
ZHkgaGF2aW5nIHJlZ3JldHMgb24gdGhpcy4gV2UgbWlnaHQgZXZlbiBoYXZlCj4gPiA+IGJyb2tl
biBzb21lIG9mIHRoZSB0dG0gZHJpdmVycyBoZXJlLgo+ID4gPiAKPiA+ID4gVHJvdWJsZSBpcywg
aWYgeW91IG5lZWQgdG8gc2hvb3QgZG93biB1c2Vyc3BhY2UgcHRlcyBvZiBhIGJvIChiZWNhdXNl
IGl0J3MKPiA+ID4gZ2V0dGluZyBtb3ZlZCBvciB3aGF0ZXZlciksIHRoZW4gd2UgZG8gdGhhdCB3
aXRoIHVubWFwX21hcHBpbmdfcmFuZ2UuCj4gPiA+IFdoaWNoIG1lYW5zIGVhY2ggYm8gbmVlZHMg
dG8gYmUgbWFwcGluZyB3aXRoIGEgdW5pcXVlIChvZmZzZXQsCj4gPiA+IGFkcmVzc19zcGFjZSks
IG9yIGl0IHdvbid0IHdvcmsuIEJ5IHJlbWFwcGluZyBhbGwgdGhlIGJvIHRvIDAgd2UndmUgYnJv
a2VuCj4gPiA+IHRoaXMuIFdlJ3ZlIGFsc28gaGFkIHRoaXMgYnJva2VuIHRoaXMgZm9yIGEgd2hp
bGUgZm9yIHRoZSBzaW1wbGlzdGljCj4gPiA+IGRtYS1idWYgbW1hcCwgc2luY2Ugd2l0aG91dCBh
bnkgZnVydGhlciBhY3Rpb24gd2UnbGwgcmV1c2UgdGhlIGFkZHJlc3MKPiA+ID4gc3BhY2Ugb2Yg
dGhlIGRtYS1idWYgaW5vZGUsIG5vdCBvZiB0aGUgZHJtX2RldmljZS4KPiA+ID4gCj4gPiA+IFN0
cmFuZ2VseSBib3RoIGV0bmF2aXYgYW5kIG1zbSBoYXZlIGEgY29tbWVudCB0byB0aGF0IGVmZmVj
dCAtIGdyZXAgZm9yCj4gPiA+IHVubWFwX21hcHBpbmdfcmFuZ2UuIEJ1dCBuZWl0aGVyIGFjdHVh
bGx5IHVzZXMgaXQuCj4gPiA+IAo+ID4gPiBOb3QgZXhhY3RseSBzdXJlIHdoYXQncyB0aGUgYmVz
dCBjb3Vyc2Ugb2YgYWN0aW9uIGhlcmUgbm93Lgo+ID4gPiAKPiA+ID4gQWxzbyBhZGRpbmcgVGhv
bWFzIFppbW1lcm1hbm4sIHdobydzIHdvcmtlZCBvbiBhbGwgdGhlIHZyYW0gaGVscGVycy4KPiA+
IAo+ID4gQ29ycmVjdGlvbiwgSSBtaXNzZWQgdGhlIHVubWFwX21hcHBpbmdfcmFuZ2UgaW4gdGhl
IHZtYSBub2RlIG1hbmFnZXIKPiA+IGhlYWRlciwgc28gZGlkbid0IHNwb3QgdGhlIGRyaXZlcnMg
dXNpbmcgZHJtX3ZtYV9ub2RlX3VubWFwLiBXZSBkaWQgYnJlYWsKPiA+IGFsbCB0aGUgdHRtIHN0
dWZmIDotLwo+IAo+IHR0bSBzdGlsbCB1c2VzIHRoZSBvZmZzZXQsIG5vdyBhZGRlZCBpbiB0dG1f
Ym9fbW1hcF9vYmooKS4gIFNvLCBmb3IKPiBub3JtYWwgbW1hcCBiZWhhdmlvciBkaWQgbm90IGNo
YW5nZSBJIHRoaW5rLiAgVGhlIHNpbXBsaXN0aWMgZG1hLWJ1Zgo+IG1tYXAgZGlkIGNoYW5nZSwg
aXQgbm93IHVzZXMgdGhlIG9mZnNldCBiZWNhdXNlIGl0IGdvZXMgdGhyb3VnaAo+IHR0bV9ib19t
bWFwX29iaigpIHRvby4KPiAKPiBOb3QgZnVsbHkgc3VyZSB3aGljaCBhZGRyZXNzIHNwYWNlIGlz
IHVzZWQgZm9yIGRtYS1idWZzIHRob3VnaC4gIEFzIGZhcgo+IEkgY2FuIHNlZSBuZWl0aGVyIHRo
ZSBvbGQgbm9yIHRoZSBuZXcgZG1hLWJ1ZiBtbWFwIGNvZGUgcGF0aCB0b3VjaAo+IHZtYS0+dm1f
ZmlsZSAodW5sZXNzIHRoZSBkcml2ZXIgZG9lcyBleHBsaWNpdGx5IGNhcmUsIGxpa2UgbXNtIGRv
ZXMgaW4KPiBtc21fZ2VtX21tYXBfb2JqKS4KPiAKPiA+IFBsdXMgcGFuZnJvc3QsIHdoaWNoIGlz
IHVzaW5nIGRybV9nZW1fc2htZW1fcHVyZ2VfbG9ja2VkLgo+IAo+IEhtbSwgbG9va2luZyBhdCBk
cm1fZ2VtX3NobWVtX3B1cmdlX2xvY2tlZCBJJ20gd29uZGVyaW5nIHdoeSBpdCB1c2VzIGEKPiBt
aXggb2YgZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmcgYW5kIGZpbGVfaW5vZGUob2JqLT5maWxw
KS0+aV9tYXBwaW5nLgo+IAo+IEFsc28gc2htZW0gaGVscGVycyB1c2VkIGEgemVybyB2bV9wZ29m
ZiBiZWZvcmUsIG9ubHkgZGlmZmVyZW5jZSBpcyB0aGUKPiBjaGFuZ2UgaXMgYXBwbGllZCBpbiBk
cm1fZ2VtX21tYXBfb2JqKCkgbm93IGluc3RlYWQgb2Ygc29tZXdoZXJlIGluIHRoZQo+IHNobWVt
IGhlbHBlciBjb2RlLgo+IAo+IHNsaWdodGx5IGNvbmZ1c2VkLAoKSSB0aGluayBzdW1tYXJ5IGlz
OgotIHNobWVtIGhlbHBlciBwdGUgc2hvdGRvd24gaXMgYnJva2VuIGZvciBhbGwgY2FzZXMgbm93
IHdpdGgKICBvYmotPmZ1bmNzLT5tbWFwCi0gdHRtL3ZyYW0taGVscGVycyBvbmx5IGZvciBkbWEt
YnVmIG1tYXAgcmVkaXJlY3Rpb24gKGJlY2F1c2Ugb2YgdGhlIHdyb25nCiAgZi9pX21hcHBpbmcp
LgoKUm9iLCBhcmUgeW91IGxvb2tpbmcgaW50byB0aGlzPyBJIGd1ZXNzIHRoZXJlJ3MgdHdvIG9w
dGlvbnM6Ci0gR28gYmFjayB0byBmYWtlIG9mZnNldCBldmVyeXdoZXJlLCBhbmQgd2VlcC4KLSBB
ZGQgYSBwZXItYm8gbWFwcGluZyBzdHJ1Y3QsIGNvbnNpc3RlbnRseSB1c2UgdGhhdCBldmVyeXdo
ZXJlIChwcm9iYWJseQogIG1vcmUgd29yaykuCgpJZiB3ZSBnbyB3aXRoIHdlZXBpbmcgbWF5YmUg
bm90ZSB0aGUgMm5kIG9wdGlvbiBhcyBhIHRvZG8gaXRlbSBpbgp0b2RvLnJzdD8KLURhbmllbAoK
PiAgIEdlcmQKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
