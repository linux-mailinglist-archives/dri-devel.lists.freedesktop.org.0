Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03BB10B57F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92676E573;
	Wed, 27 Nov 2019 18:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032F36E566
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:20:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c14so3226406wrn.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eXTXSAUEbQk9IiSeFQa+bKrNSgH/hPW+P/zlbRoXNHg=;
 b=PEKye2IAdNmLrzLUYwLckSwZZ2voAHo0cQ3B6KfXMAHtkt1Hx3vCQW7pQR8qLSHc+c
 NoHuAgEHI3vN+wC69awLAHwAg7Ha1fcw2U2kx1bO/1LwTvWG2TlsgW9CQ8WnKovWnvVR
 ZYm+POzEp8ioSKF7oHsHsbvuMHFf3t9qHTPoA4hXEwhGpIhF3FlblnWyhOd0HRQ0/3+G
 7O8ran0Gu48PzAEjBM3M6iyJa28OpE8jXJdgz+dlClxm0HthhceaEn4IooFOF06fhspA
 ADxrAeu3EEgphQ70NeretgE4b28aaLulpLWdyq6hD/nrDCEkgVAfsvt86zrfDpcWLHvH
 Psew==
X-Gm-Message-State: APjAAAWnWMvGOiCXt16dNi//y8qIbNc49z5NVthOOn665MSFmmte4kEV
 q0rE3h+nJ0NCxnAyLkzKXNpywA==
X-Google-Smtp-Source: APXvYqzGv99B481epxis71lcp1CrYsoF2Wr9YAkZU7cTnOcFdRc927zUakh3cWaGdYzvUzguevXghw==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr26656161wrn.128.1574878830622; 
 Wed, 27 Nov 2019 10:20:30 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m15sm20002427wrq.97.2019.11.27.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:20:30 -0800 (PST)
Date: Wed, 27 Nov 2019 19:20:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 03/13] video: smscufx: don't restore fb_mmap
 after deferred IO cleanup
Message-ID: <20191127182028.GI406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <5c25b31242a3ae2326ccf163e5be5ae401b04b49.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c25b31242a3ae2326ccf163e5be5ae401b04b49.1574871797.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eXTXSAUEbQk9IiSeFQa+bKrNSgH/hPW+P/zlbRoXNHg=;
 b=MlJM2o/jW8BZ6yhAcd/hDinX7nc4Fsi3NDOg241xx55lGHWVEU9aH/DoipxSzAM76f
 hzPdMq9bH7c/jURyU5DBBwuByOZtQ+8r7x7zKaitiGRmBRpb3F83VFcOtomEHDN8RJSZ
 uA2ZNLVE+Hwwi5SRgKGmBKo6+sD1MSNlYvuHI=
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6MzE6NTlQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gRGVmZXJyZWQgSU8gbm93IHByZXNlcnZlcyB0aGUgZmJfb3BzLgo+IAo+IENjOiBTdGV2
ZSBHbGVuZGlubmluZyA8c3RldmUuZ2xlbmRpbm5pbmdAc2hhd2VsbC5uZXQ+Cj4gQ2M6IGxpbnV4
LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvc21zY3VmeC5j
IHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvc21zY3VmeC5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zbXNj
dWZ4LmMKPiBpbmRleCAwZTBmNWJiZmM1ZWYuLmUzNjJkN2RhODdmYyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1ZnguYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
c21zY3VmeC5jCj4gQEAgLTExNzAsNyArMTE3MCw2IEBAIHN0YXRpYyBpbnQgdWZ4X29wc19yZWxl
YXNlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgdXNlcikKPiAgCQlmYl9kZWZlcnJlZF9pb19j
bGVhbnVwKGluZm8pOwo+ICAJCWtmcmVlKGluZm8tPmZiZGVmaW8pOwo+ICAJCWluZm8tPmZiZGVm
aW8gPSBOVUxMOwo+IC0JCWluZm8tPmZib3BzLT5mYl9tbWFwID0gdWZ4X29wc19tbWFwOwoKQWxz
byB0b3RhbGx5IHBvaW50bGVzcyB0byByZXN0b3JlIHRoaXMgaGVyZSwgc2luY2UgaWYgeW91IGhh
dmUgaW5kZWVkCmxvYWRlZCB0aGUgZHJpdmVyIHR3aWNlIHNoaXQgaGFzIGhpdCB0aGUgZmFuIGFs
cmVhZHkuIEkgZ3Vlc3MgdGhhdCB3YXMgZm9yCnRoZSBtb2R1bGUgb3B0aW9uIC4uLi4gd3RmLgoK
UmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+ICAJ
fQo+ICAKPiAgCXByX2RlYnVnKCJyZWxlYXNlZCAvZGV2L2ZiJWQgdXNlcj0lZCBjb3VudD0lZCIs
Cj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ2Z4CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
