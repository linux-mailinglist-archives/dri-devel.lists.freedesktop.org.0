Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A19114918
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 23:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125326F913;
	Thu,  5 Dec 2019 22:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688046F915
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 22:15:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c14so5564818wrn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 14:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=T74LspN/Sim+aWkc3QHBB9fwPjBZNd60Uk/Nv28Du/s=;
 b=qr+EzsssapWFnWz1aEXWLKN62lgkT2WSRKW4XtpGQdlWZQEWzqO/saRDiRhsMeIWLs
 MDtbD9X45yNFbGOUfGQvwz7Ud6UizDqudjQvErwIgml51T0/UFGbWkRGwOHCZ1A2QDtN
 qOUo78aTcTmuyKI5d8+rJJUfIZwzidnjKZ5SYj9TUknD58gMTGOA+fIOYMzNZZLTKrwp
 TPatomo5T+g/io/aR55sl8J0wxNiBMbv44FXfWDKZMC7og0kSXYhSmAuxQSjYQHvdCCD
 JxZTaQajNvgGiuEcL3PHaIac+cdWWmFMm+2JXw1qgobt3wpN1ksaJFnWGmiS9pd2iOyn
 78bg==
X-Gm-Message-State: APjAAAVS3Oo49FrK+5AmA3Jd2I49cY2sj74JVIgI8PMP/v9RPWg7YTMO
 MZB6Mk4P2Bb6gm767HcrcRAorQ==
X-Google-Smtp-Source: APXvYqz2KJmQcVZo2r5BWhzFvwZPfcySceP+bjA7xkG8teU2GR/4Qey+iWFI3/WNGKhPpgOSz0qn9A==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr12955371wru.235.1575584126055; 
 Thu, 05 Dec 2019 14:15:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t8sm13854615wrp.69.2019.12.05.14.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 14:15:25 -0800 (PST)
Date: Thu, 5 Dec 2019 23:15:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 1/2] drm: call drm_gem_object_funcs.mmap with fake
 offset
Message-ID: <20191205221523.GN624164@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, robh@kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20191127092523.5620-1-kraxel@redhat.com>
 <20191127092523.5620-2-kraxel@redhat.com>
 <20191128113930.yhckvneecpvfhlls@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128113930.yhckvneecpvfhlls@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T74LspN/Sim+aWkc3QHBB9fwPjBZNd60Uk/Nv28Du/s=;
 b=i3jTCa8yIkbx58G3q/lJhtF3uXRMcCBgX05lrNWCZ17Wzwy1NodjGtRuyLoT4LMqKj
 k/GElPm4yaYnYMETcCdJLQArY2ISn53cMG2CyfS5HiU4a1vxFkeL8yg6b8juEIuv+rPG
 r8HQyM2HJvKduKGqrFcHTYWdMDIVchw7pgoNE=
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
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMTI6Mzk6MzBQTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCAxMDoyNToyMkFNICswMTAwLCBHZXJkIEhv
ZmZtYW5uIHdyb3RlOgo+ID4gVGhlIGZha2Ugb2Zmc2V0IGlzIGdvaW5nIHRvIHN0YXksIHNvIGNo
YW5nZSB0aGUgY2FsbGluZyBjb252ZW50aW9uIGZvcgo+ID4gZHJtX2dlbV9vYmplY3RfZnVuY3Mu
bW1hcCB0byBpbmNsdWRlIHRoZSBmYWtlIG9mZnNldC4gIFVwZGF0ZSBhbGwgdXNlcnMKPiA+IGFj
Y29yZGluZ2x5Lgo+ID4gCj4gPiBOb3RlIHRoYXQgdGhpcyByZXZlcnRzIDgzYjhhNmYyNDJlYSAo
ImRybS9nZW06IEZpeCBtbWFwIGZha2Ugb2Zmc2V0Cj4gPiBoYW5kbGluZyBmb3IgZHJtX2dlbV9v
YmplY3RfZnVuY3MubW1hcCIpIGFuZCBvbiB0b3AgdGhlbiBhZGRzIHRoZSBmYWtlCj4gPiBvZmZz
ZXQgdG8gIGRybV9nZW1fcHJpbWVfbW1hcCB0byBtYWtlIHN1cmUgYWxsIHBhdGhzIGxlYWRpbmcg
dG8KPiA+IG9iai0+ZnVuY3MtPm1tYXAgYXJlIGNvbnNpc3RlbnQuCj4gPiAKPiA+IHYzOiBtb3Zl
IGZha2Utb2Zmc2V0IHR3ZWFrIGluIGRybV9nZW1fcHJpbWVfbW1hcCgpIHNvIHdlIGhhdmUgdGhp
cyBjb2RlCj4gPiAgICAgb25seSBvbmNlIGluIHRoZSBmdW5jdGlvbiAoUm9iIEhlcnJpbmcpLgo+
IAo+IE5vdyB0aGlzIHNlcmllcyBmYWlscyBpbiBJbnRlbCBDSS4gIENhbid0IHNlZSB3aHkgdGhv
dWdoLiAgVGhlCj4gZGlmZmVyZW5jZSBiZXR3ZWVuIHYyIGFuZCB2MyBpcyBqdXN0IHRoZSBwbGFj
ZSB3aGVyZSB2bWEtPnZtX3Bnb2ZmIGdldHMKPiB1cGRhdGVkLCBhbmQgbm8gY29kZSBiZXR3ZWVu
IHRoZSB2MiBhbmQgdjMgbG9jYXRpb24gdG91Y2hlcyB2bWEgLi4uCgpMb29rcyBsaWtlIHVucmVs
YXRlZCBmbHVrZXMsIHRoaXMgaGFwcGVucyBvY2Nhc2lvbmFsbHkuIElmIHlvdSdyZSBwYXJhbm9p
ZApoaXQgdGhlIHJldGVzdCBidXR0b24gb24gcGF0Y2h3b3JrIHRvIGRvdWJsZS1jaGVjay4KLURh
bmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
