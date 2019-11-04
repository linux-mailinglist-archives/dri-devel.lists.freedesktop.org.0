Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC8EE719
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEDB6E7E5;
	Mon,  4 Nov 2019 18:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A326E7E2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:14:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p4so18210903wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Ja1dpxOiZdQRF4WRGd5tdmqMRZIEK4mkNdfdHcZAVKA=;
 b=cHrVkWgtjuKfbwMbu+tH6vwr5+Z4pTZGVYipTvAQKZVzdrufTPkooRHWfueV+Hh4Im
 +Wj316h2BUciWK2ZrnwyWDztyqtzJ/pbZ4grGizmaF+JTJS/WX2XyfLM0QWHPqMp3XsK
 QH8Q508rxFbwe8FfZFMpB3UlH/tB3ZoOvGEvROb7G0oXkgRWR7GcL5TWve5pmEMCbicQ
 oJbjB438hUaUD01iWNLraDPIsz31sH2lWzPYXIHaNJHH6PGdWktYMSP+Cnsfu4vN7PyA
 rtXji72M8kd6Cm+VsYV/qHov6HoeXOUdTHj8Tyhu2LgCcpe+cliwMvo4tp99xRAeLaSb
 7ivg==
X-Gm-Message-State: APjAAAUb8xZeFUd/4cpYyL0SIvVeFJTb0Ou/bXTLMo+SkH5bmGxq7glh
 44urlgruAh4VL0gq6UG3PVGMmA==
X-Google-Smtp-Source: APXvYqzvsPDMX4qWnDUqwO1BuMR9RgHiS5saBJN9n0tnvhH51zMZSvWOrVKtr4VLclKkepxhp1KL9w==
X-Received: by 2002:adf:e602:: with SMTP id p2mr6082336wrm.348.1572891271915; 
 Mon, 04 Nov 2019 10:14:31 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y15sm4745183wrh.94.2019.11.04.10.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 10:14:31 -0800 (PST)
Date: Mon, 4 Nov 2019 19:14:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: David Airlie <airlied@redhat.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fbdev: Fallback to non tiled mode if all
 tiles not present
Message-ID: <20191104181429.GQ10326@phenom.ffwll.local>
References: <20191031214839.27039-1-manasi.d.navare@intel.com>
 <20191104091808.GA10326@phenom.ffwll.local>
 <CAMwc25oYjL3K7dcikX-oM_Y4ZP1ZRwUDKvsKO69vg81ZU6Xg8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMwc25oYjL3K7dcikX-oM_Y4ZP1ZRwUDKvsKO69vg81ZU6Xg8A@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Ja1dpxOiZdQRF4WRGd5tdmqMRZIEK4mkNdfdHcZAVKA=;
 b=cX89qb117Wbpm/lhmR6qJsxnSjMpvddQCBnB6HfaKJJgqeLFv9rW7Hui+IdTuUWllA
 97nF9KSA0MBWIFJC99F4LNrAzw4hgehkxjAvHwN8hq4yTt7ycMgrOSxKXc3410uDKfDO
 6ET920xRqNrTAYZkcIDBJrDDqbIZIW6+1AZps=
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, "Development,
 Intel" <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDc6NDg6MjZQTSArMTAwMCwgRGF2aWQgQWlybGllIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQgNzoxOCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgT2N0IDMxLCAyMDE5IGF0IDAyOjQ4
OjM5UE0gLTA3MDAsIE1hbmFzaSBOYXZhcmUgd3JvdGU6Cj4gPiA+IEluIGNhc2Ugb2YgdGlsZWQg
ZGlzcGxheXMsIGlmIHdlIGhvdHBsdWcganVzdCBvbmUgY29ubmVjdG9yLAo+ID4gPiBmYmNvbiBj
dXJyZW50bHkganVzdCBzZWxlY3RzIHRoZSBwcmVmZXJyZWQgbW9kZSBhbmQgaWYgaXQgaXMKPiA+
ID4gdGlsZWQgbW9kZSB0aGVuIHRoYXQgYmVjb21lcyBhIHByb2JsZW0gaWYgcmVzdCBvZiB0aGUg
dGlsZXMgYXJlCj4gPiA+IG5vdCBwcmVzZW50Lgo+ID4gPiBTbyBpbiB0aGUgZmJkZXYgZHJpdmVy
IG9uIGhvdHBsdWcgd2hlbiB3ZSBwcm9iZSB0aGUgY2xpZW50IG1vZGVzZXQsCj4gPiA+IHdlIHdl
IGRvbnQgZmluZCBhbGwgdGhlIGNvbm5lY3RvcnMgZm9yIGFsbCB0aWxlcywgdGhlbiBvbiBhIGNv
bm5lY3Rvcgo+ID4gPiB3aXRoIG9uZSB0aWxlLCBqdXN0IGZhbGxiYWNrIHRvIHRoZSBmaXJzdCBh
dmFpbGFibGUgbm9uIHRpbGVkIG1vZGUKPiA+ID4gdG8gZGlzcGxheSBvdmVyIGEgc2luZ2xlIGNv
bm5lY3Rvci4KPiA+ID4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IERhdmUgQWlybGll
IDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVk
aGF0LmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2
YXJlQGludGVsLmNvbT4KPiA+Cj4gPiBIbSwgc2hvdWxkIHdlIG1heWIgaGF2ZSBhIHNsaWdodCB0
aW1lb3V0IGZpcnN0IHRvIHdhaXQgZm9yIHRoZSAybmQKPiA+IGNvbm5lY3Rvcj8gT3RoZXJ3aXNl
IGxvdHMgb2YgZmxpY2tlcmluZyBnb2luZyBvbiB3aGVuIHBsdWdnaW5nIGluIG9uZSBvZgo+ID4g
dGhlc2Ugc2NyZWVucyAuLi4KPiAKPiBOb3QgcmVhbGx5LAo+IAo+IFRoZXJlIGFyZSAzIHNjZW5h
cmlvcyB3aXRoIHRoZSBtdWx0aS1jYWJsZSB0aWxlZCBtb25pdG9ycy4gYW5kCj4gbm9uLXJlc2l6
ZWFibGUgZmJkZXYuCj4gCj4gYSkgaXQncyBwbHVnZ2VkIGluIGF0IGJvb3QuIGJvdGggY2FibGVz
IGFyZSBkZXRlY3RlZCwgZmJkZXYgZ2V0cyBhCj4gZnVsbCB0aWxlZCBtb2RlLgo+IGIpIGl0J3Mg
bm90IHBsdWdnZWQgaW4gYXQgYm9vdCwgdGhlIHVzZXIgc3RhcnRzIHBsdWdnaW5nIGl0IGluLCBm
YmRldgo+IHdhcyBpbml0ZWQgdmlhIHRoZSBwYW5lbCBvciBhbm90aGVyIG1vbml0b3IuIGZiZGV2
IHdvbid0IHJlc2l6ZS4KPiBjKSBpdCdzIGhhbGYgcGx1Z2dlZCBpbiBhdCBib290LCB0aGVuIHlv
dSBnZXQgYSBub24tdGlsZWQgbW9kZSwgYW5kCj4gZmJkZXYgY2FuJ3QgcmVzaXplIHRvIHRpbGVk
IGFueXdheXMuCj4gCj4gQWxzbyBwbHVnZ2luZyBpbiBvbmUgb2YgdGhlc2UgbXVsdGktY2FibGUg
bW9uaXRvcnMgcGllY2VtZWFsIGlzIGdvaW5nCj4gdG8gdGFrZSBtdWx0aXBsZSBzZWNvbmRzIGZv
ciB0aGUgdXNlciB0byBkbyBwaHlzaWNhbCBjYWJsZSBwbHVnZ2luZy4KClVoLgoKSSBndWVzcyBm
YmRldiBmdGwsIG9oIHdlbGwuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
