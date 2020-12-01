Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627952CAA3F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 18:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CDE6E588;
	Tue,  1 Dec 2020 17:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454886E588
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 17:54:45 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id f23so5925405ejt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3f5bKCSM0CWLZs7CC/YHjerfB9zhovGUNPRgBafrc8E=;
 b=QkAA4Pnj8kdd4u5Ne3pHl1xmgor2GlSdnoN4mMsyIYdSWjP2LYlM+45ECPZ0CngEpl
 jKY9TIBbTOKz6iQaqoGFJUQ4oO7Ab71rHsL5keBEJ9OWqqU56H9ORfEa0NN4PtWe7Xht
 d+w4ORFrewGsBQEwm8tqIUHYmiJRhkF4x6ntziIgiiUM5MIYgWVxkg3VgP5vxf0Z5unl
 QzqR6QT0ZvljLiuSA3/K9lsPLc4l7SKRSUWitfRKHzl0sCvAWt7cQkDUmA0w0vS4hpR5
 7K2W5g1UP+HdrNY3dOJBcEZ28E9fClYLAVRe3rn7E2uZBTxo1fVLpA5CbvQfZ3wmZ/58
 NlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3f5bKCSM0CWLZs7CC/YHjerfB9zhovGUNPRgBafrc8E=;
 b=Hc9u9VntZuMwIjk8GttxMycQm1uu+ZGkdZmWOaoairvm7OszaWw3K7rJ9zjeWqGDZL
 zW+/6hT+ebhg8C1nYktdNkS4zkTRr9BQ3iXwYwYQRLis5MK6pKF0I3KQfPPrCGVFZtaa
 kzXpPZzL0P8CAcZPfwTQKq1KTMU+Zk8kNGAxuUwwLtAoSE1vWeITrRbTxHjuRFvbm7Mv
 i6HXumeWDkURKHTxNIDHqpQ+T7VT4rQq/sBFD4JlnuHm5D16UK/MnM2A8ziefiASTiEV
 NAzXUrGp/UXcXWs9g8yCSpa1wR2vmju2siI82+rFi+njgzPIH/pGcH/EWV5bxG8J5pxM
 YGTA==
X-Gm-Message-State: AOAM532WfHlD7QP1MLHyysrUyGJTRk43slAKqXZ2bQ50RMJPfUZjReyq
 uLzgbQdw8Vhg7Rv0LRPETZyGxJADaMc=
X-Google-Smtp-Source: ABdhPJwcSX3VnQZraLfnIo2u+yrZCrd6P/Y4BtwYFH1W1jXb2n7NMTzLFiBRfQzpSif6l5HaG3amPw==
X-Received: by 2002:a17:906:2ec3:: with SMTP id
 s3mr720650eji.133.1606845283769; 
 Tue, 01 Dec 2020 09:54:43 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id i90sm256922edd.40.2020.12.01.09.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:54:43 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: stop destroying pinned ghost object
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201201133210.109309-1-christian.koenig@amd.com>
 <CAKMK7uGvq4ZDzGuTF_FJ6nVAXS0Stmr4aBdUrbRrES_1ROHs1g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9d809f2e-7bb6-1b8f-98f5-f33cbe539e5a@gmail.com>
Date: Tue, 1 Dec 2020 18:54:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGvq4ZDzGuTF_FJ6nVAXS0Stmr4aBdUrbRrES_1ROHs1g@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMTIuMjAgdW0gMTc6NTggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgRGVj
IDEsIDIwMjAgYXQgMjozMiBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4gRGFuaWVsIGFkZGVkIGEgd2FybmluZyBmb3IgdGhp
cywgYnV0IHdlIHdlcmUgYWJ1c2luZyB0aGF0IGJlaGF2aW9yIGhlcmUuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gRml4
ZXM6IDU3ZmNkNTUwZWIxNSAoImRybS90dG06IFdhcm4gb24gcGlubmluZyB3aXRob3V0IGhvbGRp
bmcgYSByZWZlcmVuY2UiKQo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMgfCA0ICsrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPj4gaW5kZXggN2NjYjIy
OTVjYWMxLi41YmJjMTMzOWQyOGUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3V0aWwuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMK
Pj4gQEAgLTMxMCw3ICszMTAsNyBAQCBzdGF0aWMgaW50IHR0bV9idWZmZXJfb2JqZWN0X3RyYW5z
ZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+ICAgICAgICAgIGtyZWZfaW5pdCgm
ZmJvLT5iYXNlLmtyZWYpOwo+PiAgICAgICAgICBmYm8tPmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJh
bnNmZXJlZF9kZXN0cm95Owo+PiAgICAgICAgICBmYm8tPmJhc2UuYWNjX3NpemUgPSAwOwo+PiAt
ICAgICAgIGZiby0+YmFzZS5waW5fY291bnQgPSAxOwo+PiArICAgICAgIGZiby0+YmFzZS5waW5f
Y291bnQgPSAwOwo+IFdhcyB0aGlzIGp1c3QgdG8gcHJldmVudCBscnUgcmVhcGluZywgYW5kIGxl
dCB0aGUgYnVmZmVyIGRlbGV0aW9uIGNvZGUKPiBjbGVhbiB1cCBldmVyeXRoaW5nIHdoZW4gaXQn
cyBhbGwgZG9uZT8gSnVzdCBraW5kYSBmcmVha2luZyBvdXQgdGhhdAo+IHRoZXJlJ3Mgbm8gdW5w
aW4gYW55d2hlcmUgLi4uCgpZZWFoLCBkaWRuJ3QgcmVhbGl6ZWQgaG93IHRoaXMgd29ya3MgYmVm
b3JlIGVpdGhlci4KCj4gQW55d2F5IHRyYWNraW5nIGdob3N0IG9iamVjdHMgd2l0aCB0aGUgbHJ1
IGxpa2UgYW55dGhpbmcgZWxzZSBpbnN0ZWFkCj4gb2YgdHJpY2tzIHdpdGggcGluIGNvdW50IHNv
dW5kcyBsaWtlIGEgZ29vZCBpZGVhLgoKV2VsbCBJIHJlYWxseSB3YW50IHRvIG51a2UgZ2hvc3Qg
b2JqZWN0cyB3aGljaCB3b3VsZCBiZSBhbiBldmVuIGJldHRlciAKaWRlYSA6KQoKPiBBY2tlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClRoYW5rcywKQ2hyaXN0
aWFuLgoKPgo+IEJ1dCBtYXliZSBhc2sgRGF2ZSBvciBUaG9tYXMgZm9yIGEgc2Vjb25kIGNoZWNr
Lgo+IC1EYW5pZWwKPgo+PiAgICAgICAgICBpZiAoYm8tPnR5cGUgIT0gdHRtX2JvX3R5cGVfc2cp
Cj4+ICAgICAgICAgICAgICAgICAgZmJvLT5iYXNlLmJhc2UucmVzdiA9ICZmYm8tPmJhc2UuYmFz
ZS5fcmVzdjsKPj4KPj4gQEAgLTMxOSw2ICszMTksOCBAQCBzdGF0aWMgaW50IHR0bV9idWZmZXJf
b2JqZWN0X3RyYW5zZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+ICAgICAgICAg
IHJldCA9IGRtYV9yZXN2X3RyeWxvY2soJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPj4gICAgICAg
ICAgV0FSTl9PTighcmV0KTsKPj4KPj4gKyAgICAgICB0dG1fYm9fbW92ZV90b19scnVfdGFpbF91
bmxvY2tlZCgmZmJvLT5iYXNlKTsKPj4gKwo+PiAgICAgICAgICAqbmV3X29iaiA9ICZmYm8tPmJh
c2U7Cj4+ICAgICAgICAgIHJldHVybiAwOwo+PiAgIH0KPj4gLS0KPj4gMi4yNS4xCj4+Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
