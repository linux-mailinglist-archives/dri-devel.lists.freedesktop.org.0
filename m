Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48B71312
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BDF6E1B2;
	Tue, 23 Jul 2019 07:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6969C89FE3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 07:38:25 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w13so42912806eds.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 00:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=7B0kZX39j3W386MkiBK5UtIQjJKLhUJXGNvhcv6FvJM=;
 b=o76fFEo/FUZ2DgW3O9BdPFqZ/IsMNQ16pTOFqwaYduAFtJcE1eMzbE7CLnk7aPnh7+
 QR5zIQhUZsXCzyjUVRmjyPd/sQSvwbwbUoufAH/e9TXWfBAWrV3+Ed15pQxr4u9Oq1EU
 trGOwQV366xt61uFNljVMvABoLd6wV6wRsQXylX43q2x4Rc/d+D4N1mR4d8sOkPXJ3kz
 eRUogLEJY2Zzh3GJoszY+Ddv1kXwwnR9Ir2ag4ThsXBUd8LmM+tT8QPINiJAFi4hNMhb
 D3ERtJsLBBG+XhbGWTlFpPIwkE621mtLYcYv5/Eu7r+e+9jjStwvIYFnNqwEIk04i9Xt
 lLfQ==
X-Gm-Message-State: APjAAAV5XgeLSQs0MX/67PXTKDgCpIA2mZno39+F+G19UWipq+J/n38+
 6PWIdN80F0JC9Hs0Tw7IBus=
X-Google-Smtp-Source: APXvYqwF4gFYfyab0NSDDcoxUf0q4mq+1/ft/cvJV0XQFBad+3aIdLa/PEUi1UMzB5ntGyuBECBlJw==
X-Received: by 2002:a50:fa05:: with SMTP id b5mr63382580edq.269.1563867503924; 
 Tue, 23 Jul 2019 00:38:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q50sm12035831edd.91.2019.07.23.00.38.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 00:38:22 -0700 (PDT)
Date: Tue, 23 Jul 2019 09:38:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] vt: Grab console_lock around con_is_bound in show_bind
Message-ID: <20190723073820.GU15868@phenom.ffwll.local>
Mail-Followup-To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 Jens Remus <jremus@linux.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-s390@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Pitre <nicolas.pitre@linaro.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 Adam Borowski <kilobyte@angband.pl>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7B0kZX39j3W386MkiBK5UtIQjJKLhUJXGNvhcv6FvJM=;
 b=UotmLHtjCylIkscSMrotfIX1/Li5qjbBU2wYwaOu2++8uyWsR2wviLhrtbk9D81NUV
 qfa1fZFnhwaoyKSsCHzf2q6gHNnlF2Q9F6c8BH4WjbNV5Ijw7ivhNnyrmBrOWELPOkXL
 67diRvPht3Ri71Ku1n1tB/k+cTWzW/xAZUqiw=
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-s390@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Hostettler <textshell@uchuujin.de>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jens Remus <jremus@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZywKCkRvIHlvdSBwbGFuIHRvIHBpY2sgdGhpcyB1cCBpbiB5b3VyIGNvbnNvbGUvdnQv
d2hhdGV2ZXItZml4ZXMgYnJhbmNoPwpUaGVyZSdzIG5vIHJlYXNvbiBmb3IgbWUgdG8gcm91dGUg
dGhpcyB0aHJvdWdoIGRybS1maXhlcy4KLURhbmllbAoKT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQg
MTA6MDk6MDNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBOb3QgcmVhbGx5IGhhcm1m
dWwgbm90IHRvLCBidXQgYWxzbyBub3QgaGFybSBpbiBncmFiYmluZyB0aGUgbG9jay4gQW5kCj4g
dGhpcyBzaHV0cyB1cCBhIG5ldyBXQVJOSU5HIEkgaW50cm9kdWNlZCBpbiBjb21taXQgZGRkZTNj
MThiNzAwICgidnQ6Cj4gTW9yZSBsb2NraW5nIGNoZWNrcyIpLgo+IAo+IFJlcG9ydGVkLWJ5OiBK
ZW5zIFJlbXVzIDxqcmVtdXNAbGludXguaWJtLmNvbT4KPiBDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxp
bnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+
IENjOiBOaWNvbGFzIFBpdHJlIDxuaWNvbGFzLnBpdHJlQGxpbmFyby5vcmc+Cj4gQ2M6IE1hcnRp
biBIb3N0ZXR0bGVyIDx0ZXh0c2hlbGxAdWNodXVqaW4uZGU+Cj4gQ2M6IEFkYW0gQm9yb3dza2kg
PGtpbG9ieXRlQGFuZ2JhbmQucGw+Cj4gQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVk
aGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBD
YzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3R0eS92
dC92dC5jIHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS92dC92dC5jIGIvZHJpdmVy
cy90dHkvdnQvdnQuYwo+IGluZGV4IGVjOTJmMzZhYjVjNC4uMzRhYTM5ZDFhZWQ5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdHR5L3Z0L3Z0LmMKPiArKysgYi9kcml2ZXJzL3R0eS92dC92dC5jCj4g
QEAgLTM3NzEsNyArMzc3MSwxMSBAQCBzdGF0aWMgc3NpemVfdCBzaG93X2JpbmQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKPiAgCQkJIGNoYXIgKmJ1
ZikKPiAgewo+ICAJc3RydWN0IGNvbl9kcml2ZXIgKmNvbiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Owo+IC0JaW50IGJpbmQgPSBjb25faXNfYm91bmQoY29uLT5jb24pOwo+ICsJaW50IGJpbmQ7Cj4g
Kwo+ICsJY29uc29sZV9sb2NrKCk7Cj4gKwliaW5kID0gY29uX2lzX2JvdW5kKGNvbi0+Y29uKTsK
PiArCWNvbnNvbGVfdW5sb2NrKCk7Cj4gIAo+ICAJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9T
SVpFLCAiJWlcbiIsIGJpbmQpOwo+ICB9Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
