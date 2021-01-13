Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DE2F5D6A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE9C6E123;
	Thu, 14 Jan 2021 09:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C16E3D8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 09:33:29 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id b64so943210qkc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 01:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aSSMZaLwu/9dwFOQ4pwytWHBiv3JbaNrKM24rxWA6bg=;
 b=A3sGeKXMwvf0FWboCZmz8xvjI+V1YQrxtBbk2p5Cf1QMjGBrW53hJRJeGIyf7TZaYb
 wWF5FZ8mtM5+3CsmJGgoQDf5gEiNxdZhKmptutGGyHVgDB4JuZdrMukzvPbTQ8jpz9wI
 u6HdpooUjgqFxrfR1RqMP5mkOQlSXzyhW15Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aSSMZaLwu/9dwFOQ4pwytWHBiv3JbaNrKM24rxWA6bg=;
 b=V0E68/b6wcTUesmKL1pzi3+ssR4KECXso6SAeo2NQnjL6fEr5TzFHuOlzARrR2lsXP
 S3oVkmPDcfg0ssOPNMqIFN5FlXy/EvkN4vM5GpRSkOavDljZQzSFwHYTa31yjba/9DI8
 kOfOhPnpoQK0BWL+T82IQm0FoLVH4fS7IShcj4FFBXMDW3YZZ1jAXxYijyI7K8u7bMQB
 0yguwcGcUobkK4JPky7lnZ3mHDQ0yK5l8u5oPUXQn0Wmfh0EvrrfEuwIb8gY/6fp0yKk
 IMHGj8gVXZBL4BFjI5Q+ugW5N2U27A4x/b1KyqS6l878vSq7bfGN5EZnX77yJD/2JM9f
 psUw==
X-Gm-Message-State: AOAM533pvsMxEhXikIjlP46nCIl3kxQhmVw4FX/uY36a/mNAQJK8hWNu
 F7h8UHCjK0jl7440lTcrUGj+V6+jdYZ/9995qFeCsw==
X-Google-Smtp-Source: ABdhPJxFoeCMKjXIwaelaQ40FLmiq8HK7DNnZpHM2WeYs1q+VaZFiGlKvZJYjYA+ZwQa6YPAXBtNxTMJobFc8lfWAVs=
X-Received: by 2002:a37:4497:: with SMTP id r145mr1092681qka.241.1610530408846; 
 Wed, 13 Jan 2021 01:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20210113084733.1181460-1-stevensd@chromium.org>
 <e0797913-7314-979f-cea8-6af3a67a22a6@amd.com>
In-Reply-To: <e0797913-7314-979f-cea8-6af3a67a22a6@amd.com>
From: David Stevens <stevensd@chromium.org>
Date: Wed, 13 Jan 2021 18:33:17 +0900
Message-ID: <CAD=HUj4isb5-knjijDj6MqGkk6xSQuXt3uBK8jBy1qtxHM9NZg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: use compound pages for THP
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgNTo1OCBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMTMuMDEuMjEgdW0gMDk6NDcgc2Nocmll
YiBEYXZpZCBTdGV2ZW5zOgo+ID4gQ29tcG91bmQgcGFnZSBtZXRhZGF0YSBpcyBuZWNlc3Nhcnkg
Zm9yIHBhZ2UgcmVmZXJlbmNlIGNvdW50aW5nIHRvIHdvcmsKPiA+IHByb3Blcmx5IG9uIHBhZ2Vz
IGJlc2lkZXMgdGhlIGhlYWQgcGFnZS4gV2l0aG91dCBpdCwgcHV0X3BhZ2UKPiA+IGNvcnJlc3Bv
bmRpbmcgdG8gdGhlIGxhc3Qgb3V0c3RhbmRpbmcgZ2V0X3BhZ2UgY2FsbCBvbiBhIHRhaWwgcGFn
ZSB3aWxsCj4gPiBlbmQgdXAgZnJlZWluZyB0aGF0IHBhZ2UsIGV2ZW4gaWYgdGhlIGJvIHN0aWxs
IHJlZmVyZW5jZXMgdGhlIHBhZ2UuCj4KPiBOQUssIEkgc2hvdWxkIGFkZCBhIGNvbW1lbnQgc2lu
Y2UgSSBjYW4ndCBjb3VudCBhbnkgbW9yZSBob3cgbWFueSB0aW1lcwo+IHBlb3BsZSBjYW1lIHVw
IHdpdGggdGhpcy4KPgo+IENhbGxpbmcgcHV0X3BhZ2UoKSBvbiBhIFRUTSBhbGxvY2F0ZWQgcGFn
ZSBpcyBzdHJpY3RseSBpbGxlZ2FsIGluIHRoZQo+IGZpcnN0IHBsYWNlIHNpbmNlIHRoZXkgYXJl
IG5vdCByZWZlcmVuY2UgY291bnRlZC4KPgo+IFBsZWFzZSBkb24ndCB0ZWxsIG1lIHNvbWVib2R5
IG9uY2UgbW9yZSB0cmllZCB0byBtbWFwKCkgcGFnZXMgZnJvbSBhCj4gRE1BLWJ1ZiBjcmVhdGVk
IHNnX3RhYmxlIGludG8gYSBwcm9jZXNzIGFkZHJlc3Mgc3BhY2U/CgpJIHJhbiBpbnRvIHRoaXMg
b24gYSBzeXN0ZW0gdXNpbmcgdGhlIGN1cnJlbnRseSBpbiBkZXZlbG9wbWVudAp2aXJ0aW8tZ3B1
IGJsb2IgcmVzb3VyY2VzIFsxXS4gVGhlIGltcGxlbWVudGF0aW9uIHBhc3NlcyBkbWEgYnVmZmVy
cwphbGxvY2F0ZWQgYnkgdGhlIGhvc3QgZ3B1IHRvIEtWTV9TRVRfVVNFUl9NRU1PUllfUkVHSU9O
LCBzbyB0aGUgZ3Vlc3QKY2FuIGRpcmVjdGx5IGFjY2VzcyB0aGUgYnVmZmVycyB3aXRob3V0IHRo
ZSBuZWVkIGZvciBhbiBpbnRlcm1lZGlhdGUKY29weS4KClsxXSBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvZHJpLWRldmVsL2NvdmVyLzIwMjAwODE0MDI0MDAwLjI0ODUtMS1n
dXJjaGV0YW5zaW5naEBjaHJvbWl1bS5vcmcvCgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgU3RldmVucyA8c3RldmVuc2RAY2hyb21pdW0ub3Jn
Pgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyB8IDEgLQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29s
LmMKPiA+IGluZGV4IDdiMmY2MDYxNjc1MC4uMDkyMzliOTNkYzJjIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9wb29sLmMKPiA+IEBAIC04Myw3ICs4Myw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAq
dHRtX3Bvb2xfYWxsb2NfcGFnZShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIGdmcF90IGdmcF9mbGFn
cywKPiA+ICAgICAgICAgICAgICAgZ2ZwX2ZsYWdzIHw9IEdGUF9UUkFOU0hVR0VfTElHSFQgfCBf
X0dGUF9OT1JFVFJZIHwKPiA+ICAgICAgICAgICAgICAgICAgICAgICBfX0dGUF9LU1dBUERfUkVD
TEFJTTsKPiA+ICAgICAgICAgICAgICAgZ2ZwX2ZsYWdzICY9IH5fX0dGUF9NT1ZBQkxFOwo+ID4g
LSAgICAgICAgICAgICBnZnBfZmxhZ3MgJj0gfl9fR0ZQX0NPTVA7Cj4gPiAgICAgICB9Cj4gPgo+
ID4gICAgICAgaWYgKCFwb29sLT51c2VfZG1hX2FsbG9jKSB7Cj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
