Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E64293682
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E93C6EC20;
	Tue, 20 Oct 2020 08:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F244E6EC20
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:13:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c77so807986wmd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=yjES9gaqH+r7PKEyUF//AteATy2JRLBioQzscOmtXtA=;
 b=JU+b83GXhEyYD9j42iFgaYqnEO9pM4i2Bnxt6a3R+hgfkw4l0pphxZBqjqWuycfUOv
 AregJP2jMrx2ZNIM+a1L2a+9YxvUrSigYexSKsti5xs69jqMYZqYUJ5KnsxGIXQmyfkN
 cRnfL+KygxgYnz3FGsyQquXL/4MJlSdYZ95ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=yjES9gaqH+r7PKEyUF//AteATy2JRLBioQzscOmtXtA=;
 b=Ys/zZ61gzJxzJhoU34rpU3eMmQuyUHiAwstB0zDITD0gPtwjJ9/b1rGAwVuq0L4Zjg
 Enat8jvch6zu4p1QG4YM3gFRjwFWgzPGwTOtOmXr4CnuRtHGG5UjQEPTEKQkP7tKicOR
 2IOdObO7FBISxddcOfB0vYytycoljc4WTk9j1mkproqRKWhANNYkEzvIclUSyexW4qtX
 RhNlI0jUdFWLBDuWMlKmVrsuNd3Fe1FM1w2FurXelmB4gm+R/MTmbjLa7dxld4Dlkb5J
 4UrZBGammbaitmeuqUrvY1Se8ocXhJVZbtdNwQZtDDCPD0syvJzQlEFH+zUgS47ASRee
 2OWg==
X-Gm-Message-State: AOAM531LYqUWEQD9LwyhRx/yc2GWFhBVsCpsYXN17vdUTf6j+LGeOI4p
 6eE64PADSc0Yt2QpSQmDBZYKlw==
X-Google-Smtp-Source: ABdhPJxnbA1ge0KCPiotTT9AHiVkZI9rcl5PStryqvQltSAM5y0gDcnp2H45cAeIHcdY9QnKtEvmcA==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr1638057wmc.42.1603181604585;
 Tue, 20 Oct 2020 01:13:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v17sm1917002wrc.23.2020.10.20.01.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 01:13:23 -0700 (PDT)
Date: Tue, 20 Oct 2020 10:13:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v2] drm/of: Consider the state in which the ep is disabled
Message-ID: <20201020081321.GI401619@phenom.ffwll.local>
Mail-Followup-To: Kever Yang <kever.yang@rock-chips.com>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, huangtao@rock-chips.com,
 andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200707112526.18438-1-hjc@rock-chips.com>
 <5c0cdb9d-8e35-fa0c-35b3-adfa7770fb30@rock-chips.com>
 <20201015152301.GE438822@phenom.ffwll.local>
 <e016801a-61aa-de6c-cb90-c62e03bdd067@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e016801a-61aa-de6c-cb90-c62e03bdd067@rock-chips.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: huangtao@rock-chips.com, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, andy.yan@rock-chips.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTksIDIwMjAgYXQgMTE6NDM6NTNBTSArMDgwMCwgS2V2ZXIgWWFuZyB3cm90
ZToKPiBIaSBEYW5pZWwsCj4gCj4gT24gMjAyMC8xMC8xNSDkuIvljYgxMToyMywgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDA5OjQ4OjQzQU0gKzA4MDAs
IEtldmVyIFlhbmcgd3JvdGU6Cj4gPiA+IEhpIE1haW50YWluZXJzLAo+ID4gPiAKPiA+ID4gIMKg
wqDCoCBEb2VzIHRoaXMgcGF0Y2ggcmVhZHkgdG8gbWVyZ2U/Cj4gPiBXb3VsZCBtYXliZSBiZSBn
b29kIHRvIGdldCBzb21lIGFja3MgZnJvbSBvdGhlciBkcml2ZXJzIHVzaW5nIHRoaXMsIHRoZW4K
PiA+IFNhbmR5IGNhbiBwdXNoIHRvIGRybS1taXNjLW5leHQuCj4gCj4gVGhhbmtzIGZvciB5b3Vy
IHJlcGx5LCBJIGNhbiB1bmRlcnN0YW5kIG1vcmUgJ2Fja3MnIHdpbGwgYmUgYmV0dGVyLCBidXQK
PiB0aGVyZSBpcyBubyBjb21tZW50cyBvYmplY3QgdG8gdGhpcyBwYXRjaAo+IAo+IG9yIGFueSAn
TkFLJyBjb21tb24gZm9yIG1vcmUgdGhlbiAzIG1vbnRocywgbWFpbnRhaW5lcnMgc2hvdWxkIG1v
dmUgdG8gbmV4dAo+IHN0ZXAuCgpJIGV4cGVjdCB5b3UgdG8gcG9rZSByZWxldmFudCBkcml2ZXIg
bWFpbnRhaW5lcnMgZGlyZWN0bHkgZm9yIHRoZXNlIGFja3MuClRoYXQgd2FzIHRoZSBwdXJwb3Nl
IG9mIG15IG1haWwuIEFsbCBjb21tdW5pY2F0aW9uIGdvaW5nIHRocm91Z2gKbWFpbnRhaW5lcnMs
IGJlaW5nIGV4Y2x1c2l2ZWx5IG9yY2hlc3RyYXRlZCBieSBtYWludGFpbmVycywganVzdCBkb2Vz
bid0CnNjYWxlLiBTbyBub3QgYW4gb3B0aW9uIGZvciBhIGJpZyBzdWJzeXN0ZW0gbGlrZSBkcml2
ZXJzL2dwdS4KCkhvcGUgdGhhdCBtYWtlcyBpdCBjbGVhci4KCkZvciBtZXJnaW5nIFNhbmR5IGhh
cyBjb21taXQgcmlnaHRzIHRvIGRybS1taXNjLCBzbyB0aGF0J3Mgbm90IHRoZQpwcm9ibGVtLgoK
Q2hlZXJzLCBEYW5pZWwKCj4gCj4gCj4gVGhhbmtzLAo+IAo+IC0gS2V2ZXIKPiAKPiA+IC1EYW5p
ZWwKPiA+ID4gT24gMjAyMC83Lzcg5LiL5Y2INzoyNSwgU2FuZHkgSHVhbmcgd3JvdGU6Cj4gPiA+
ID4gZG9uJ3QgbWFzayBwb3NzaWJsZV9jcnRjcyBpZiByZW1vdGUtcG9pbnQgaXMgZGlzYWJsZWQu
Cj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNo
aXBzLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMg
fCAzICsrKwo+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4g
PiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9vZi5jCj4gPiA+ID4gaW5kZXggZmRiMDVmYmY3MmEwLi41NjVmMDVmNWYx
MWIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jCj4gPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jCj4gPiA+ID4gQEAgLTY2LDYgKzY2LDkgQEAg
dWludDMyX3QgZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3Moc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKPiA+ID4gPiAgICAJdWludDMyX3QgcG9zc2libGVfY3J0Y3MgPSAwOwo+ID4gPiA+ICAgIAlm
b3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKHBvcnQsIGVwKSB7Cj4gPiA+ID4gKwkJaWYgKCFvZl9k
ZXZpY2VfaXNfYXZhaWxhYmxlKGVwKSkKPiA+ID4gPiArCQkJY29udGludWU7Cj4gPiA+ID4gKwo+
ID4gPiA+ICAgIAkJcmVtb3RlX3BvcnQgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnQoZXApOwo+
ID4gPiA+ICAgIAkJaWYgKCFyZW1vdGVfcG9ydCkgewo+ID4gPiA+ICAgIAkJCW9mX25vZGVfcHV0
KGVwKTsKPiA+ID4gTG9va3MgZ29vZCB0byBtZS4KPiA+ID4gCj4gPiA+IAo+ID4gPiBSZXZpZXdl
ZC1ieTogS2V2ZXIgWWFuZyA8a2V2ZXIueWFuZ0Byb2NrLWNoaXBzLmNvbT4KPiAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
