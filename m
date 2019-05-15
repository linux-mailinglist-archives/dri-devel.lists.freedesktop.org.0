Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969791EA4E
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 10:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E5189580;
	Wed, 15 May 2019 08:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E6C89617
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 08:41:01 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id j12so2974340eds.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 01:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=FdcLrUKFRpFqcrmWlbc00T4H/Dk2umMdZulimfgIMmQ=;
 b=k49BsXPfw+WbiIn2Wmzfky6p3gUGmr32zXyWGn0k2r+rpBcEyOE1qTNZNYbW+4qFJb
 ZM95f7fPC2eyEknWiPPyEX65RGr3yjT2wlrzz77Z3bzPLblyR09yjYSK0dJ4S0A3n4mk
 FO92sKRPdyFglg0FH2tgwJ6KHFAlohIQHhqgClxIhKLgj+FPSmd0dmp0jEGsh+1/cATr
 Sg7PtdPGQu++IM9sZfTSuhvu3CmOtRi9AL3IeWAMZhFmPZ+JaJe0dyUWhHbqLw2Ol+Dy
 Hs3WnmWN5t1TlODaVhHnrh9CMyCyyYkpzrmnYSNw/Xkh5sGcktQiwLyCXMbdBmd9N7gg
 F7+w==
X-Gm-Message-State: APjAAAXpmi0fRfSd9XAlcZZuAqbPbgh2X+JuV8OOYh0mdO7u6+hPLMXl
 yDPfCyLjAgnC50YyHxAAa4qlOg==
X-Google-Smtp-Source: APXvYqw64r5yce3+KLuWcpU1FElh8HBxNDG4ljB5mXJmel3Ws6hwZ7GzWy08kyhNUqGOIbGenI5RaQ==
X-Received: by 2002:a17:906:29d3:: with SMTP id
 y19mr32175102eje.122.1557909660533; 
 Wed, 15 May 2019 01:41:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y42sm554094edb.95.2019.05.15.01.40.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 01:40:59 -0700 (PDT)
Date: Wed, 15 May 2019 10:40:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 09/11] drm/ttm: convert EDEADLK into EAGAIN
Message-ID: <20190515084057.GC17751@phenom.ffwll.local>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-9-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514123127.1650-9-christian.koenig@amd.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=FdcLrUKFRpFqcrmWlbc00T4H/Dk2umMdZulimfgIMmQ=;
 b=GiL/L/j6LVuonmUpZ8xhiKt8fNy80UW/TMVfcKbGhpBQEsdxKSTzlotVBq7SnhJC+S
 jCkn6Wz69ZsYXgKoqEJFe0s7WZU8u43nQFdcgwOq2mwZUHeXtx//osx3GAokzRjo0eC4
 YSF0xyhmyQ6v/QxC4ZTXFApKpFAaMifM4kxxA=
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
Cc: Marek.Olsak@amd.com, amd-gfx@lists.freedesktop.org, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDI6MzE6MjVQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBMZXQgdXNlcnNwYWNlIHRyeSBhZ2FpbiBpZiB3ZSByZWFsbHkgcnVuIGludG8g
YSBkZWFkbG9jayBkdXJpbmcgZXZpY3Rpb24uCj4gCj4gVGhpcyBoYXMgYSBsb3cgY2hhbmNlIG9m
IGxpdmUgbG9ja2luZywgYnV0IHdpdGggZ3VhcmFudGVlZCBmb3J3YXJkIHByb2Nlc3MuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMiArKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggYTMw
MWM4NzZhZTMxLi5jZTg1Y2Q4YjQ5NzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtODc3
LDYgKzg3Nyw4IEBAIHN0YXRpYyBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwKPiAgCQkJCQkgICAgYWNxdWlyZV9jdHgpOwo+ICAJCWlmIChyZXQpIHsK
PiAgCQkJdHRtX2JvX3B1dChmaXJzdF9ibyk7Cj4gKwkJCWlmIChyZXQgPT0gLUVERUFETEspCgpJ
cyB0aGlzIHRoZSB3d19tdXRleCBFREVBRExLIG9yIHNvbWV0aGluZyBlbHNlPyBJZiB0aGUgZm9y
bWVyIHRoZW4gbGV0dGluZwp0aGF0IGVzY2FwZSB1bmhhbmRsaW5nIGludG8gdXNlcnNwYWNlIHNv
dW5kcyBsaWtlIGEga2VybmVsIGJ1ZyAuLi4KLURhbmllbAoKPiArCQkJCXJldCA9IC1FQUdBSU47
Cj4gIAkJCXJldHVybiByZXQ7Cj4gIAkJfQo+ICAJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2sp
Owo+IC0tIAo+IDIuMTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
