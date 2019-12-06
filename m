Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF933114FA0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 12:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB16F9D3;
	Fri,  6 Dec 2019 11:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6D56F9D4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 11:10:27 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id b8so5823695oiy.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 03:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLu8PQob6R7INQhNcyi5eV/VwuZ3ViZfX5Cr/XgalEQ=;
 b=kjQMqPbALispXxrt3jLM67dArjjpLg/U54vpEykY5sPwKGdiKci6tglz9bqMmR3ih8
 xHvkGLQraZMKTfm1LESxGvUcgInX6QUjLsEHQDPNixs+8a/IKxS0vRmDiyeqxyLl0osP
 9jL3g0T0TO/a3922b1ZrWUbHmx7I4xcJGXZ7oeISjxgNfV0fg0Fw6ws7o6qbj1RWC0e6
 EGebUEzDPe4IJ/x86gHA+mNjeztzpblec+cTKnv1SfObs1L9v91ScnIf7iuvBLXpCO9U
 2obXX+qNSj99zq2iXYnzRLOJFdzgCG2OiqazJSaso4iYSlGnYqG9EfVFzm2iDrGmkiJP
 erXw==
X-Gm-Message-State: APjAAAVi79Pkjdf+3AF9gK0mj1yDHlTAh/3EBzxRDOZQwPr11ONHmFu2
 3w75PDm129nBSFUUpaOppBDsKI+CxxhLYpLKUXL2VA==
X-Google-Smtp-Source: APXvYqwOneJdtD1ZXuC72wTUlo4WXxW+SIIYiQGT6fyPkbbuOUD9Np8+lzYh2iG8qelEE2FENTDJM+w77++vv8XFiOI=
X-Received: by 2002:aca:d985:: with SMTP id
 q127mr11318982oig.132.1575630626520; 
 Fri, 06 Dec 2019 03:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20191127092523.5620-1-kraxel@redhat.com>
 <20191127092523.5620-2-kraxel@redhat.com>
 <20191128113930.yhckvneecpvfhlls@sirius.home.kraxel.org>
 <20191205221523.GN624164@phenom.ffwll.local>
 <20191206100724.ukzdyaym3ltcyfaa@sirius.home.kraxel.org>
 <20191206102200.6osisct57n424ujn@sirius.home.kraxel.org>
In-Reply-To: <20191206102200.6osisct57n424ujn@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 6 Dec 2019 12:10:15 +0100
Message-ID: <CAKMK7uF=wZ8snurJwftyjVD2ExutfzNUGGhy8=UVFYf3=sz7qQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm: call drm_gem_object_funcs.mmap
 with fake offset
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jLu8PQob6R7INQhNcyi5eV/VwuZ3ViZfX5Cr/XgalEQ=;
 b=Gl+qSlNmaiBh0lNDEeK3wAVf56e6C5UDX83HhGX2mAZ0NU7ZMDBd5ZqrCdExodjS0m
 Wu9uL2ysiXsTj5+0JMTAvsUZCoXiKc1DPnp3tGKgifxfZZKBSRR21SCkXTuzVdC4l7ET
 PuOGIaoh+vqX5AjF6mwGN1EmWc/JfZ6nL4RIE=
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgNiwgMjAxOSBhdCAxMToyMiBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwNiwgMjAxOSBhdCAxMTowNzoyNEFNICsw
MTAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOgo+ID4gT24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMTE6
MTU6MjNQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gTG9va3MgbGlrZSB1bnJl
bGF0ZWQgZmx1a2VzLCB0aGlzIGhhcHBlbnMgb2NjYXNpb25hbGx5LiBJZiB5b3UncmUgcGFyYW5v
aWQKPiA+ID4gaGl0IHRoZSByZXRlc3QgYnV0dG9uIG9uIHBhdGNod29yayB0byBkb3VibGUtY2hl
Y2suCj4gPiA+IC1EYW5pZWwKPiA+Cj4gPiBHdWVzcyB5b3Uga2lja2VkIENJPyAgSnVzdCBnb3Qg
Q0kgbWFpbHMsIG5vdyByZXBvcnRpbmcgc3VjY2Vzcywgd2l0aG91dAo+ID4gZG9pbmcgYW55dGhp
bmcuICBTbyBJJ2xsIGdvIHB1c2ggdjMgdG8gbWlzYy1uZXh0Lgo+Cj4gT29wcywgc3Bva2UgdG9v
IHNvb24uICBOZXh0IG1haWwgYXJyaXZlZC4gIEZpLkNJLkJBVCB3b3JrcywgYnV0Cj4gRmkuQ0ku
SUdUIHN0aWxsIGZhaWxzLgo+Cj4gV2hlcmUgaXMgdGhlICJ0ZXN0IGFnYWluIiBidXR0b24/ICBD
YW4gSSByZS1ydW4gdGhlIHRlc3RzIG9uIHYyPyAgUmlnaHQKPiBub3cgSSB0ZW5kIHRvIGNvbW1p
dCB2MiB0byBoYXZlIGEgZml4IGNvbW1pdHRlZCwgdGhlbiBnbyBmaWd1cmUgd2h5IHYzCj4gZmFp
bHMgLi4uCgpUb3Agb2YgdGhlIG1haWwgeW91IGdldCBmcm9tIENJIGlzIHRoZSBsaW5rIHRvIHRo
ZSBwYXRjaHdvcmsgc2VyaWVzLgpUaGF0IGNvbnRhaW5zIGFsbCB0aGUgc2FtZSBpbmZvIGxpa2Ug
aW4gdGhlIG1haWwsIHBsdXMgdGhlIGNvdmV0ZWQKYnV0dG9uLiBJZiBmYWlsdXJlcyBsb29rIHNp
bWlsYXIgdGhlbiB5ZXMgSSBndWVzcyB2MyBpcyBzb21laG93CmJyb2tlbi4gQnV0IEkndmUgbG9v
a2VkLCBsb29rcyBsaWtlIGp1c3QgMnggdW5yZWxhdGVkIG5vaXNlIGFuZCB5b3UKYmVpbmcgdW5s
dWNreSwgc28gaW1vIHRvdGFsbHkgZmluZSB0byBwdXNoIHYzLiBJJ2xsIGdpdmUgQ0kgZm9sa3Mg
YQpoZWFkcy11cCAoYmVzdCBkb25lIG92ZXIgaXJjIHVzdWFsbHkpLgotRGFuaWVsCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
