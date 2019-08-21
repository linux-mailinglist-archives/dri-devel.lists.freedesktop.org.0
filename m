Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3998581
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B49E6EA1B;
	Wed, 21 Aug 2019 20:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0CC6EA17
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 20:22:59 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id o101so3300907ota.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 13:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MKzvDm+ztYbW7s8xYbQH0GgXMCIamw1+1ytg0mPF2A8=;
 b=aKX+wRIZ2Qb+ZPZ5LMIIX0Raf7uHVUunsX2xcmyY0kV5Umdl0nwMBYJiiHlEk8Kj2o
 1BgUdXtXKIo6qwUt3Nz2YEdyp8LQpiFnYFBSI288IchZD/3i1nxP2RizXaat5OtEmk34
 /FJT6MVDiJ0tuLL1u1FCvFhQURiur466QvHNSkd63rPUxyyIwo4UEhTy5YJw+DhNPAVL
 mT+XyX74oSWEyR9SQYH4D88ehx4aIf6Kj9B76nwVXP6tJjYkEhrRuDDidpe1ho/TBOQL
 bIU83qKe7I9D+OdfkEW8983otzPkPD8P1zAk5izhBLP2ICQWNSzUnYXlLfyW/TOwG7vE
 RGlw==
X-Gm-Message-State: APjAAAWq6WyhNhiiQ6S7ziYkLKjDOML7ETF7oNWwlhIw9AmeqQh/HT8B
 aMn4RQY8QpcbOau44l1r6PJ0FcHkNO8Wv6NmCz2bwgckSwg=
X-Google-Smtp-Source: APXvYqxzQXGnnKkIYCYTX+26SGzVn5ZVSNVD//25VTXs31hGvwkhLv0KLTL93xyFsm0usIgLXw2XWLJOtx8wuvtcIys=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr29956498oto.204.1566418979173; 
 Wed, 21 Aug 2019 13:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
In-Reply-To: <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Aug 2019 22:22:47 +0200
Message-ID: <CAKMK7uFAreLt64Y9btk4VNxo6a2YMgXrg136z0uuyy5B3SMS+A@mail.gmail.com>
Subject: Re: [RFC] replacing dma_resv API
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MKzvDm+ztYbW7s8xYbQH0GgXMCIamw1+1ytg0mPF2A8=;
 b=bJB9mLV4u+q7ZA3/b2C0MxHlyFCbkgj0+BPIvFsWr5qTv+m61JrH+4mikUmO36rEzh
 GHIuTv8y2YOM+7L8jsfwb1SqW255J/fdl2x7ENOv8MljNHvWHAwfLZh0yxm46ODx7FUv
 gP2AQbCTBs1fisoXguY7cOLS7BKNT4Y492ZSQ=
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTA6MTEgUE0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gUXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5
LTA4LTIxIDEzOjMxOjM3KQo+ID4gSGkgZXZlcnlvbmUsCj4gPgo+ID4gSW4gcHJldmlvdXMgZGlz
Y3Vzc2lvbiBpdCBzdXJmYWNlZCB0aGF0IGRpZmZlcmVudCBkcml2ZXJzIHVzZSB0aGUgc2hhcmVk
IGFuZCBleHBsaWNpdCBmZW5jZXMgaW4gdGhlIGRtYV9yZXN2IG9iamVjdCB3aXRoIGRpZmZlcmVu
dCBtZWFuaW5ncy4KPiA+Cj4gPiBUaGlzIGlzIHByb2JsZW1hdGljIHdoZW4gd2Ugc2hhcmUgYnVm
ZmVycyBiZXR3ZWVuIHRob3NlIGRyaXZlcnMgYW5kIHJlcXVpcmVtZW50cyBmb3IgaW1wbGljaXQg
YW5kIGV4cGxpY2l0IHN5bmNocm9uaXphdGlvbiBsZWFkZWQgdG8gcXVpdGUgYSBudW1iZXIgb2Yg
d29ya2Fyb3VuZHMgcmVsYXRlZCB0byB0aGlzLgo+ID4KPiA+IFNvIEkgc3RhcnRlZCBhbiBlZmZv
cnQgdG8gZ2V0IGFsbCBkcml2ZXJzIGJhY2sgdG8gYSBjb21tb24gdW5kZXJzdGFuZGluZyBvZiB3
aGF0IHRoZSBmZW5jZXMgaW4gdGhlIGRtYV9yZXN2IG9iamVjdCBtZWFuIGFuZCBiZSBhYmxlIHRv
IHVzZSB0aGUgb2JqZWN0IGZvciBkaWZmZXJlbnQga2luZCBvZiB3b3JrbG9hZHMgaW5kZXBlbmRl
bnQgb2YgdGhlIGNsYXNzaWMgRFJNIGNvbW1hbmQgc3VibWlzc2lvbiBpbnRlcmZhY2UuCj4gPgo+
ID4gVGhlIHJlc3VsdCBpcyB0aGlzIHBhdGNoIHNldCB3aGljaCBtb2RpZmllcyB0aGUgZG1hX3Jl
c3YgQVBJIHRvIGdldCBhd2F5IGZyb20gYSBzaW5nbGUgZXhwbGljaXQgZmVuY2UgYW5kIG11bHRp
cGxlIHNoYXJlZCBmZW5jZXMsIHRvd2FyZHMgYSBub3RhdGlvbiB3aGVyZSB3ZSBoYXZlIGV4cGxp
Y2l0IGNhdGVnb3JpZXMgZm9yIHdyaXRlcnMsIHJlYWRlcnMgYW5kIG90aGVycy4KPgo+IEZ3aXcs
IEkgd291bGQgbGlrZSB0aGUgZGlzdGluY3Rpb24gaGVyZSBiZXR3ZWVuIG9wdGlvbmFsIGZlbmNl
cwo+ICh3cml0ZXJzLCByZWFkZXJzKSBhbmQgbWFuZGF0b3J5IGZlbmNlcyAob3RoZXJzKS4gVGhl
IG9wdGlvbmFsIGZlbmNlcwo+IGFyZSB3aGVyZSB3ZSBwdXQgdGhlIGltcGxpY2l0IGZlbmNlIHRy
YWNraW5nIHRoYXQgY2xldmVyIHVzZXJzcGFjZSB3b3VsZAo+IHJhdGhlciBhdm9pZC4gVGhlIG1h
bmRhdG9yeSBmZW5jZXMgKEkgd291bGQgY2FsbCBpbnRlcm5hbCkgaXMgd2hlcmUgd2UKPiBwdXQg
dGhlIGZlbmNlcyBmb3IgdHJhY2tpbmcgbWlncmF0aW9uIHRoYXQgdXNlcnNwYWNlIGNhbiBub3Qg
b3B0IG91dCBvZi4KCkkgdGhpbmsgdGhpcyB3b3VsZCBtYWtlIHNlbnNlLCBhbmQgaXMga2luZGEg
d2hhdCBJIGV4cGVjdGVkIGhlcmUuIElmCihhbmQgSSB0aGluayB0aGF0J3MgYSBodWdlIGlmKSB3
ZSBjYW4gYWdyZWUgb24gd2hhdCB0aG9zZSBpbnRlcm5hbApmZW5jZXMgYXJlLiBUaGVyZSdzIGEg
aHVnZSBkaWZmZXJlbmNlIGJldHdlZW4gaW50ZXJuYWwgZmVuY2VzIGZvcgpidWZmZXIgbW92ZXMg
KGJldHRlciBub3QgaWdub3JlIHRob3NlKSBhbmQgaW50ZXJuYWwgZmVuY2VzIGxpa2UKYW1ka2Zk
J3MgZXZpY3Rpb24gZmVuY2UgKGJldHRlciBpZ25vcmUgdGhvc2UpLiBTbyB3aGF0ZXZlciB3ZSBk
byBhZGQsCml0IGJldHRlciBjb21lIHdpdGggcmVhbGx5IGNsZWFyIGRvY3MgYW5kIHByZXR0eSBk
aWFncmFtcyBhYm91dCB3aGF0Cml0J3Mgc3VwcG9zZWQgdG8gZG8sIGFuZCBob3cgaXQncyBzdXBw
b3NlZCB0byBiZSB1c2VkLiBPciB3ZSdyZSBqdXN0CmJhY2sgdG8gdGhlIGN1cnJlbnQgbWVzcyB3
ZSdyZSBpbiwgdGltZXMgdHdvLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
