Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9318D104129
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D036E929;
	Wed, 20 Nov 2019 16:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91BC6E8FD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:43:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y5so316273wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=1KQFiCKYTYZzwFOLOMf9doqI26iQyvpquxyM5/JGafU=;
 b=F5D0j3HjeKjNb7WFuWEbmFkUrJ2pjcP315nkiiaAL01iWpnW31ImUzkghxtHDFQNrR
 icnHLFOfneASdW7uTtf5CGOEDOJM3pe17bu+lMUXNPoQ3VUjvF6PL7YWNk3wRV/7azRL
 a93tGfoI1OT2wdK0v300dqyQpHFUzxKXdNYBynsokRU/Y3aIRM6GlrpD+YZWAVppSKUM
 qrANj/zZL6cequILP+jxQYP3tYVe5F1JAsOjZtQEzz2+oFx2G9Hih5vkL+KuCH00Cq7O
 YFcR0rrm5H/2a4k3J/JVSSzVXZE/rhehtuBNxWg3g2AV+j2YFjeveALwviJ0/ttUM3wq
 7mgg==
X-Gm-Message-State: APjAAAXZfA080fYanCZeKWgqMm0HuhGqdo5VoUSmyCr0Oox7zV767m/V
 zvrjNEntpK4O7INccMDU9VHmaSTpWF8=
X-Google-Smtp-Source: APXvYqyQXYmxIBAv76lokKHJXos/BYOogWlTqNzAAjKEHWvOzdt9njv+0f41I1awvdlkmUxZuirXUw==
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr4560529wmi.51.1574268223266; 
 Wed, 20 Nov 2019 08:43:43 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u18sm32508584wrp.14.2019.11.20.08.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:43:42 -0800 (PST)
Date: Wed, 20 Nov 2019 17:43:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/rect: Keep the clipped dst rectangle
 in place
Message-ID: <20191120164340.GS30416@phenom.ffwll.local>
References: <20191120162512.12484-1-ville.syrjala@linux.intel.com>
 <20191120162512.12484-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120162512.12484-2-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=1KQFiCKYTYZzwFOLOMf9doqI26iQyvpquxyM5/JGafU=;
 b=FbPiG4gXfFpkPthGY/tMEUKwxssDG59APisNxyiw67rcFsaY3uS4lT6Nxv3ik2tpqG
 fPUYw+m9tApJnwJApQGYeEkHrIdXpdKcye15VTqO/9XRxljPpjaFFTLlh0XBP/g74ciL
 nFz1EHu0YmyH0kdQZCo75SWf96YgUh0nhyqrY=
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDY6MjU6MTJQTSArMDIwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IE5vdyB0aGF0IHdlJ3ZlIGNvbnN0cmFpbmVkIHRoZSBjbGlwcGVkIHNvdXJjZSBy
ZWN0YW5nbGUgc3VjaAo+IHRoYXQgaXQgY2FuJ3QgaGF2ZSBuZWdhdGl2ZSBkaW1lbnNpb25zIGRv
aW5nIHRoZSBzYW1lIGZvciB0aGUKPiBkc3QgcmVjdGFuZ2xlIHNlZW1zIGFwcHJvcHJpYXRlLiBT
aG91bGQgYXQgbGVhc3QgcmVzdWx0IGluCj4gdGhlIGNsaXBwZWQgc3JjIGFuZCBkc3QgcmVjdGFu
Z2xlcyBiZWluZyBhIGJpdCBtb3JlIGNvbnNpc3RlbnQKPiB3aXRoIGVhY2ggb3RoZXIuCj4gCj4g
Q2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+Cj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KCnNlbGZ0ZXN0cyBmb3IgdGhpcyBzdHVmZj8gTG9va3MgbGlrZSB0aGUgcHJpbWUgZXhhbXBs
ZSwgd3JpdGUgdGVzdGNhc2UKcHJvdmluZyBjb2RlIGlzIGJ1c3RlZCwgZml4IGl0LCBldmVyeW9u
ZSBjZWxlYnJhdGU/Ci1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5j
IHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcmVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiBpbmRleCA3NzYyYjZl
OTI3OGQuLjIyOTMyNWZjZjMzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Jl
Y3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCj4gQEAgLTUyLDE0ICs1Miwx
NCBAQCBib29sIGRybV9yZWN0X2ludGVyc2VjdChzdHJ1Y3QgZHJtX3JlY3QgKnIxLCBjb25zdCBz
dHJ1Y3QgZHJtX3JlY3QgKnIyKQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3JlY3RfaW50ZXJz
ZWN0KTsKPiAgCj4gLXN0YXRpYyB1MzIgY2xpcF9zY2FsZWQodTMyIHNyYywgdTMyIGRzdCwgdTMy
IGNsaXApCj4gK3N0YXRpYyB1MzIgY2xpcF9zY2FsZWQoaW50IHNyYywgaW50IGRzdCwgaW50ICpj
bGlwKQo+ICB7Cj4gIAl1NjQgdG1wOwo+ICAKPiAgCS8qIE9ubHkgY2xpcCB3aGF0IHdlIGhhdmUu
IEtlZXBzIHRoZSByZXN1bHQgYm91bmRlZCBhcyB3ZWxsLiAqLwo+IC0JY2xpcCA9IG1pbihjbGlw
LCBkc3QpOwo+ICsJKmNsaXAgPSBtaW4oKmNsaXAsIGRzdCk7Cj4gIAo+IC0JdG1wID0gbXVsX3Uz
Ml91MzIoc3JjLCBkc3QgLSBjbGlwKTsKPiArCXRtcCA9IG11bF91MzJfdTMyKHNyYywgZHN0IC0g
KmNsaXApOwo+ICAKPiAgCS8qCj4gIAkgKiBSb3VuZCB0b3dhcmQgMS4wIHdoZW4gY2xpcHBpbmcg
c28gdGhhdCB3ZSBkb24ndCBhY2NpZGVudGFsbHkKPiBAQCAtOTIsMzQgKzkyLDM0IEBAIGJvb2wg
ZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVj
dCAqZHN0LAo+ICAJZGlmZiA9IGNsaXAtPngxIC0gZHN0LT54MTsKPiAgCWlmIChkaWZmID4gMCkg
ewo+ICAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAo+
IC0JCQkJCSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsKPiArCQkJCQkgICAgZHJtX3Jl
Y3Rfd2lkdGgoZHN0KSwgJmRpZmYpOwo+ICAKPiAgCQlzcmMtPngxID0gc3JjLT54MiAtIG5ld19z
cmNfdzsKPiAtCQlkc3QtPngxID0gY2xpcC0+eDE7Cj4gKwkJZHN0LT54MSArPSBkaWZmOwo+ICAJ
fQo+ICAJZGlmZiA9IGNsaXAtPnkxIC0gZHN0LT55MTsKPiAgCWlmIChkaWZmID4gMCkgewo+ICAJ
CXUzMiBuZXdfc3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwKPiAtCQkJ
CQkgICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksIGRpZmYpOwo+ICsJCQkJCSAgICBkcm1fcmVjdF9o
ZWlnaHQoZHN0KSwgJmRpZmYpOwo+ICAKPiAgCQlzcmMtPnkxID0gc3JjLT55MiAtIG5ld19zcmNf
aDsKPiAtCQlkc3QtPnkxID0gY2xpcC0+eTE7Cj4gKwkJZHN0LT55MSArPSBkaWZmOwo+ICAJfQo+
ICAJZGlmZiA9IGRzdC0+eDIgLSBjbGlwLT54MjsKPiAgCWlmIChkaWZmID4gMCkgewo+ICAJCXUz
MiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAo+IC0JCQkJCSAg
ICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsKPiArCQkJCQkgICAgZHJtX3JlY3Rfd2lkdGgo
ZHN0KSwgJmRpZmYpOwo+ICAKPiAgCQlzcmMtPngyID0gc3JjLT54MSArIG5ld19zcmNfdzsKPiAt
CQlkc3QtPngyID0gY2xpcC0+eDI7Cj4gKwkJZHN0LT54MiAtPSBkaWZmOwo+ICAJfQo+ICAJZGlm
ZiA9IGRzdC0+eTIgLSBjbGlwLT55MjsKPiAgCWlmIChkaWZmID4gMCkgewo+ICAJCXUzMiBuZXdf
c3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwKPiAtCQkJCQkgICAgZHJt
X3JlY3RfaGVpZ2h0KGRzdCksIGRpZmYpOwo+ICsJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0
KSwgJmRpZmYpOwo+ICAKPiAgCQlzcmMtPnkyID0gc3JjLT55MSArIG5ld19zcmNfaDsKPiAtCQlk
c3QtPnkyID0gY2xpcC0+eTI7Cj4gKwkJZHN0LT55MiAtPSBkaWZmOwo+ICAJfQo+ICAKPiAgCXJl
dHVybiBkcm1fcmVjdF92aXNpYmxlKGRzdCk7Cj4gLS0gCj4gMi4yMy4wCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4CgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
