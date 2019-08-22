Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F247298DE6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B474A8989E;
	Thu, 22 Aug 2019 08:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD68989E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 08:37:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t16so4570264wra.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 01:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qHqGzI3h6bGS7SsXoxtNnAD8/KMthB9ts12wm/m1eDo=;
 b=ACRkkm0IiMPcO9T0F8Vm5OrQcwWl1Jx7U0eFCfqtQ/HRFrQgaZSP/20YdtJ2tLEKXR
 NSo5ISj/+ougz6782ehLfi3EqcgtwbkNlL0atWGAR5sy/yKHKlD09O/4SS7/hHECpkR/
 TljPz+k/x/6eYAminKA2XhBh1YyfPgBFHPqY3iwkZC1THX/eNj0De2B8zG/RGRKMkn0s
 1Ne0xSje05P1uV1OReEHtTuArSI96leP5l6B3+w84KM3VMMgkCol00x8yHOoeXyNiQAx
 eQAP4sNlcpS3kNnS6uiEhD3EQDilLxf50RF7A7gWSg/+SD2k7KhkdNoDq4IrRmCTDwl+
 Uv1g==
X-Gm-Message-State: APjAAAUM5672HO7d4OAJP/zc4VrMWsevfXz4oLSIrFSBeidypZ3LxrXY
 QvSQprGxI5IrJkJTU5yz5f0Qc0EJ
X-Google-Smtp-Source: APXvYqzdnU9t8ZEiiXpnOtQfSt7dy2nTHQVHAAc8vwelIXp0H+dR1wesZhPTChfDg57Ppdd202C+vw==
X-Received: by 2002:adf:f14f:: with SMTP id y15mr45649273wro.28.1566463042071; 
 Thu, 22 Aug 2019 01:37:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w13sm55729223wre.44.2019.08.22.01.37.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 01:37:21 -0700 (PDT)
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
To: Chris Wilson <chris@chris-wilson.co.uk>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
 <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
 <156640893097.20466.17027932311642169386@skylake-alporthouse-com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5a2aea22-6857-d061-4a80-64f2f57da007@gmail.com>
Date: Thu, 22 Aug 2019 10:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156640893097.20466.17027932311642169386@skylake-alporthouse-com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qHqGzI3h6bGS7SsXoxtNnAD8/KMthB9ts12wm/m1eDo=;
 b=svgTT1e6pwUX0FYCa/TK8wFPHCvQOwllQyIUxvPuvAZdBnNaxUcA5RCqQ7wr45sxJq
 H0iRVQhLqOuq5bu2KYrDBBlgELVeJj0e8KfDhSKSwZFXQZ3jWE1kctG0pvnrLOy4kiaw
 9wL9In2fT4AA7jQVPHbt1OVw+W3s1tBc0TfNHrAB4GfgCByTBcZmhQynhNeR2u6h3Bme
 k5Y71yDkkknYmn3SNkb5gR3+IjsyG2/XqfY2mvMYoh91mZhfcvSvcrhRze1MgVJc7f+E
 0GkbVcuJXxm6JmFqcVo9+yM9sgyeizfZhbQqheP54y3h1msRyineluEX6J3KfAyc4uTg
 wVlw==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDguMTkgdW0gMTk6MzUgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
cyBXaWxzb24gKDIwMTktMDgtMjEgMTY6MjQ6MjIpCj4+IFF1b3RpbmcgQ2hyaXN0aWFuIEvDtm5p
ZyAoMjAxOS0wOC0yMSAxMzozMTo0NSkKPj4+IEBAIC0xMTcsMTcgKzEyMCwxMCBAQCBpOTE1X2dl
bV9idXN5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4+PiAgICAg
ICAgICAgICAgICAgIGJ1c3lfY2hlY2tfd3JpdGVyKHJjdV9kZXJlZmVyZW5jZShvYmotPmJhc2Uu
cmVzdi0+ZmVuY2VfZXhjbCkpOwo+Pj4gICAKPj4+ICAgICAgICAgIC8qIFRyYW5zbGF0ZSBzaGFy
ZWQgZmVuY2VzIHRvIFJFQUQgc2V0IG9mIGVuZ2luZXMgKi8KPj4+IC0gICAgICAgbGlzdCA9IHJj
dV9kZXJlZmVyZW5jZShvYmotPmJhc2UucmVzdi0+ZmVuY2UpOwo+Pj4gLSAgICAgICBpZiAobGlz
dCkgewo+Pj4gLSAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzaGFyZWRfY291bnQgPSBsaXN0
LT5zaGFyZWRfY291bnQsIGk7Cj4+PiAtCj4+PiAtICAgICAgICAgICAgICAgZm9yIChpID0gMDsg
aSA8IHNoYXJlZF9jb3VudDsgKytpKSB7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZG1hX2ZlbmNlICpmZW5jZSA9Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJjdV9kZXJlZmVyZW5jZShsaXN0LT5zaGFyZWRbaV0pOwo+Pj4gLQo+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgYXJncy0+YnVzeSB8PSBidXN5X2NoZWNrX3JlYWRlcihmZW5jZSk7Cj4+PiAt
ICAgICAgICAgICAgICAgfQo+Pj4gLSAgICAgICB9Cj4+PiArICAgICAgIHJlYWRlcnMgPSBkbWFf
cmVzdl9mZW5jZXNfZ2V0X3JjdSgmb2JqLT5iYXNlLnJlc3YtPnJlYWRlcnMpOwo+Pj4gKyAgICAg
ICBkbWFfZmVuY2VfYXJyYXlfZm9yX2VhY2goZmVuY2UsIGN1cnNvciwgcmVhZGVycykKPj4+ICsg
ICAgICAgICAgICAgICBhcmdzLT5idXN5IHw9IGJ1c3lfY2hlY2tfcmVhZGVyKGZlbmNlKTsKPj4+
ICsgICAgICAgZG1hX2ZlbmNlX3B1dChyZWFkZXJzKTsKPj4gVGhhdCdzIHVuZGVyd2hlbG1pbmcs
IHRoZSBmdWxsLW1iIHNob3dzIHVwIGluIHNjYWxpbmcgdGVzdHMgKEknbGwgdGVzdAo+PiB0aGUg
aW1wYWN0IG9mIHRoaXMgc2VyaWVzIGxhdGVyKS4gU29tZXRoaW5nIGxpa2UsCj4gVG8gcHV0IHNv
bWUgbnVtYmVycyB0byBpdCwgYWRkaW5nIHRoZSBmdWxsLW1iIGFkZHMgNW5zIHRvIGEgc2luZ2xl
Cj4gdGhyZWFkIG9uIEthYnlsYWtlIGFuZCAyMG5zIHVuZGVyIGNvbnRlbnRpb24uCgpUaGUgcXVl
c3Rpb24gaXMgaWYgdGhhdCdzIHRoZSB1c2UgY2FzZSB3ZSB3YW50IHRvIG9wdGltaXplIGZvci4K
ClF1ZXJ5aW5nIGEgYnVmZmVyIGZvciBidXNpbmVzcyBpcyBzb21ldGhpbmcgd2UgZG8gYWJzb2x1
dGVseSByYXJlbHkgb24gCmFtZGdwdSwgZS5nLiBJSVJDIHdlIGV2ZW4gZ3JhYiB0aGUgZnVsbCBy
ZXNlcnZhdGlvbiBsb2NrIGZvciB0aGlzLgoKQnV0IGFkZGluZyBuZXcgZmVuY2VzIGNvbWVzIHdp
dGggZXZlcnkgY29tbWFuZCBzdWJtaXNzaW9uLgoKV2hhdCBjb3VsZCBtYXliZSB3b3JrIGlzIHRo
ZSAiZG8geyB9IHdoaWxlIChmZW5jZSBoYXMgY2hhbmdlZCk7IGxvb3AgeW91IApzdWdnZXN0ZWQg
ZWFybGllciBpbiB0aGlzIG1haWwgdGhyZWFkLCBidXQgSSBuZWVkIHRvIGRvdWJsZSBjaGVjayBp
ZiAKdGhhdCB3b3VsZCByZWFsbHkgd29yayBvciBjbGFzaCB3aXRoIHJlY3ljbGluZyBkbWFfZmVu
Y2VfYXJyYXlzKCkuCgpDaHJpc3RpYW4uCgo+IC1DaHJpcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
