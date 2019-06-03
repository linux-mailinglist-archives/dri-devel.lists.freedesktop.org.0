Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046123293C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DE98919C;
	Mon,  3 Jun 2019 07:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80E88919C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 07:21:37 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b8so25465889edm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 00:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=gFfIdF/n8x9LT3ceqwBlRcsjQrjw05kTQWHccSDGFEA=;
 b=pzXhs1WJjDUTKjDD/6iC1v+ZJgX1JY5WwlRpjOJyhAlRzoZy3Hf3l6JKxsXnf9ot+C
 /qfszVneAW1/lOJcAhu2UcYweMjnheGZjKe9sRJdMjWAnIDdn/nmlbD02SOHzDhr43Os
 tkJFA5x0DB854XtAqsOwO3W0c8iXwcJvDX48ET1R4T+lIsXmhPOUihS3RGQYZxWEHjaM
 n5hHQIaOMUAKxOUz7EIyVEh4KLuPnU4njq78+6cRQdZtGfbtD3HJCTpfEGmiyvxodkVx
 hfRW9DtJ2MM9jCALIeK13oo7rLHQSI5I+M1L8XoJvydQnmhvy8AYmnNzFVOUnlnNUwbx
 Anzw==
X-Gm-Message-State: APjAAAXEl8otGzpaYvLcjIPXxSpbjIEo/49lm0xNRXo50SEQS6eWoOWs
 C3HRJ4X2nS15a2M2yjlQmU+B1Q==
X-Google-Smtp-Source: APXvYqwB8W6p328obsO2GUM9qbglOVSdU1Hj36hKwIwd0vJqDrSsCF4qg1YvDB2sFScs2Tfuz6t+YA==
X-Received: by 2002:a17:906:7d16:: with SMTP id
 u22mr22083921ejo.85.1559546496534; 
 Mon, 03 Jun 2019 00:21:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d20sm2430431ejr.21.2019.06.03.00.21.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 00:21:35 -0700 (PDT)
Date: Mon, 3 Jun 2019 09:21:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/gem_shmem: Use a writecombine mapping for ->vaddr
Message-ID: <20190603072133.GY21222@phenom.ffwll.local>
References: <20190529065121.13485-1-boris.brezillon@collabora.com>
 <87woi6wrrh.fsf@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87woi6wrrh.fsf@anholt.net>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gFfIdF/n8x9LT3ceqwBlRcsjQrjw05kTQWHccSDGFEA=;
 b=FeLmPIKdUfqLlg2ZH8pT5ZxnLBPnC+jBkOY5QMobkftkDQjVa+oolaxw7nvqJ9chOo
 SaykguEQq/XgAHxCESpP82J8OLmYWvAlCnmy7Lf5BjkEggp07w3O9Qysb07VriEDxy3o
 bE4IxANttnxY4XKf+X2r38fNTvvuqOr6iMVII=
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
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDg6NDY6NThBTSAtMDcwMCwgRXJpYyBBbmhvbHQgd3Jv
dGU6Cj4gQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3Jp
dGVzOgo+IAo+ID4gUmlnaHQgbm93LCB0aGUgQk8gaXMgbWFwcGVkIGFzIGEgY2FjaGVkIHJlZ2lv
biB3aGVuIC0+dm1hcCgpIGlzIGNhbGxlZAo+ID4gYW5kIHRoZSB1bmRlcmx5aW5nIG9iamVjdCBp
cyBub3QgYSBkbWFidWYuCj4gPiBEb2luZyB0aGF0IG1ha2VzIGNhY2hlIG1hbmFnZW1lbnQgYSBi
aXQgbW9yZSBjb21wbGljYXRlZCAoeW91J2QgbmVlZAo+ID4gdG8gY2FsbCBkbWFfbWFwL3VubWFw
X3NnKCkgb24gdGhlIC0+c2d0IGZpZWxkIGV2ZXJ5dGltZSB0aGUgQk8gaXMgYWJvdXQKPiA+IHRv
IGJlIHBhc3NlZCB0byB0aGUgR1BVL0NQVSksIHNvIGxldCdzIG1hcCB0aGUgQk8gd2l0aCB3cml0
ZWNvbWJpbmUKPiA+IGF0dHJpYnV0ZXMgaW5zdGVhZCAoYXMgZG9uZSBpbiBtb3N0IGRyaXZlcnMp
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+IEZvdW5kIHRoaXMgaXNzdWUgd2hpbGUgd29ya2lu
ZyBvbiBwYW5mcm9zdCBwZXJmY250IHdoZXJlIHRoZSBHUFUgZHVtcHMKPiA+IHBlcmYgY291bnRl
ciB2YWx1ZXMgaW4gbWVtb3J5IGFuZCB0aGUgQ1BVIHJlYWRzIHRoZW0gYmFjayBpbgo+ID4ga2Vy
bmVsLXNwYWNlLiBUaGlzIHBhdGNoIHNlZW1zIHRvIHNvbHZlIHRoZSB1bnByZWRpY3RhYmxlIGJl
aGF2aW9yIEkKPiA+IGhhZC4KPiA+Cj4gPiBJIGNhbiBhbHNvIGdvIGZvciB0aGUgb3RoZXIgb3B0
aW9uIChjYWxsIGRtYV9tYXAvdW5tYXAvX3NnKCkgd2hlbgo+ID4gbmVlZGVkKSBpZiB5b3UgdGhp
bmsgdGhhdCdzIG1vcmUgYXBwcm9wcmlhdGUuCj4gCj4gd3JpdGVjb21iaW5lZCB3YXMgdGhlIGlu
dGVudCwgYW5kIHRoaXMgbWFrZXMga2VybmVsIHZtYXAgbWF0Y2ggdGhlCj4gdXNlcnNwYWNlIG1t
YXAgcGF0aC4KClNpbmNlIEkgbWlzc2VkIHRoYXQgb2J2aW91c2x5OiBXaGVyZSBkbyB0aGUgc2ht
ZW0gaGVscGVycyBzZXQgd3JpdGUKY29tYmluZWQgbW9kZSBmb3IgdXNlcnNwYWNlIG1tYXA/Ci1E
YW5pZWwKCj4gCj4gUmV2aWV3ZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CgoK
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
