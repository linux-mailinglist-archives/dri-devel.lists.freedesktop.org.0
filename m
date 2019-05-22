Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A68262EE
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 13:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD810898E1;
	Wed, 22 May 2019 11:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B4E898E1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 11:27:44 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id u64so1319668oib.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 04:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BvA/x1xx9GtLYOu766CekleAM64Q92AJdIsptuXMtgE=;
 b=p9j4pqUS8cz5+LQhdOoxQfa4Nuus28vzIbjT889jqkSHlDgdgpEJakDlSKvYYKlLEv
 CW1tkNq7ugNjvItjHOOwcBisVVj6eoJSU6IqToWE9N9w6zLEs53u85MFv9RRnv46VOzA
 86P22BbcyDrmut2Tg6ku8vwYr8tAsVAVo4WlhKj1AkAX/Q6ZyrlskuoLv+PU/r+AQJxn
 KUJD0v4ZcuaLZba4bwAwm2WeNZ+yiNG+rPhWYLjXZyL6ss+ZKe5wsVKu++CjPO4N9n57
 G3NN1PlfSsEpAbknbrtwyVt6uV5h/7dzDUSBvFr1O5nYfyiUyNH/z6YbfCv/gkvIE8F8
 oUDA==
X-Gm-Message-State: APjAAAXlH9pL3ql94ozI/tP7CX8Va4fJaL3NydS176EfErmwIEUpOFt4
 pi7FopzWOZ8e/vVtE4crsgWsK3JZMC11itmSvAsV0uHS
X-Google-Smtp-Source: APXvYqzNBBAhfE8Cf0fvOvyuElUBUgnvA+xOAiUlMcGb0ei2qgdLn+lvyu0Qcq+N+tBN6AGBftTythTkSRvOlmaAKd8=
X-Received: by 2002:aca:e4c8:: with SMTP id b191mr7040910oih.110.1558524463289; 
 Wed, 22 May 2019 04:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190515143831.1639-1-christian.koenig@amd.com>
 <20190522081949.GU21222@phenom.ffwll.local>
 <c7324bd8-e003-207e-af80-96bcbdf8870a@gmail.com>
In-Reply-To: <c7324bd8-e003-207e-af80-96bcbdf8870a@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 May 2019 13:27:31 +0200
Message-ID: <CAKMK7uHL6pouBwM3-srbdBUOD1BbWFobiALp3VVu3ohyFEK9bQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v8
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BvA/x1xx9GtLYOu766CekleAM64Q92AJdIsptuXMtgE=;
 b=Tl8vTLxGXQLKcEumtrh0dVr5aWaMV5snbaSIPaw826aSisIpUZk7V4E416WehwQvGz
 pRfaosMxXC0fCbdeWgjjplhJJmVR6G8fchkMJAysQYeja0p4AzP+2xiwHQhQGXFRr08r
 Z8G8srfqKccijEnvAvizl2jFSInvAO8WrcrVk=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTA6NDkgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMjIuMDUuMTkgdW0gMTA6
MTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDQ6
Mzg6MjZQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+IFtTTkFQXQo+ID4gSnVz
dCB0aGlzIGZ1bmN0aW9uYWwgY29tbWVudCwgc2luY2UgSSB0aGluayBhcGkgZGV0YWlsIHBvbGlz
aGluZyBpcwo+ID4gcHJlbWF0dXJlIGlmIHdlJ3JlIG5vdCB5ZXQgYXdhcmUgb2YgaG93IHRoaXMg
d29ya3MuCj4gPgo+ID4+ICsgICAgLyogV2hlbiB0aGUgaW1wb3J0ZXIgaXMgZHluYW1pYyBidXQg
dGhlIGV4cG9ydGVyIGlzbid0IHdlIG5lZWQgdG8gY2FjaGUKPiA+PiArICAgICAqIHRoZSBtYXBw
aW5nIG9yIG90aGVyd2lzZSB3b3VsZCBydW4gaW50byBpc3N1ZXMgd2l0aCB0aGUgcmVzZXJ2YXRp
b24KPiA+PiArICAgICAqIG9iamVjdCBsb2NrLgo+ID4+ICsgICAgICovCj4gPj4gKyAgICBpZiAo
ZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoYXR0YWNoKSAmJgo+ID4+ICsgICAgICAgICFk
bWFfYnVmX2lzX2R5bmFtaWMoZG1hYnVmKSkgewo+ID4gSXNuJ3QgdGhpcyB0aGUgd3Jvbmcgd2F5
IHJvdW5kPyBkeW5hbWljIGltcG9ydGVycyBzaG91bGQgYmUgcGVyZmVjdGx5IGZpbmUKPiA+IHdp
dGggdGhlIHJlc2VydmF0aW9uIGxvY2tzIGluIHRoZWlyIG1hcC91bm1hcCBwYXRocywgaXQncyBp
bXBvcnRlcnMKPiA+IGNhbGxpbmcgZXhwb3J0ZXJzIHRoZXJlLgo+ID4KPiA+IFRoZSByZWFsIHBy
b2JsZW0gaXMgYSBub3QtZHluYW1pYyBpbXBvcnRlciwgd2hpY2ggaGFzbid0IGJlIGFkanVzdGVk
IHRvCj4gPiBhbGxvdyB0aGUgcmVzZXJ2YXRpb24gbG9jayBpbiB0aGVpciBwYXRocyB3aGVyZSB0
aGV5IG1hcC91bm1hcCBhIGJ1ZmZlciwKPiA+IHdpdGggYSBkeW5hbWljIGV4cG9ydGVyLiBUaGF0
J3Mgd2hlcmUgd2UgbmVlZCB0byBjYWNoZSB0aGUgbWFwcGluZyB0bwo+ID4gYXZvaWQgdGhlIGRl
YWRsb2NrIChvciBoYXZpbmcgdG8gY2hhbmdlIGV2ZXJ5b25lKQo+Cj4gV2VsbCBjb3VsZCBiZSB0
aGF0IHRoaXMgaXMgYWxzbyBhIHByb2JsZW0sIGJ1dCBJIGFjdHVhbGx5IGRvbid0IHRoaW5rIHNv
Lgo+Cj4gVGhlIGNhc2UgSSdtIGRlc2NyaWJpbmcgaGVyZSBjZXJ0YWlubHkgaXMgdGhlIG1vcmUg
b2J2aW91cyBwcm9ibGVtCj4gYmVjYXVzZSB0aGUgaW1wb3J0ZXIgaXMgYWxyZWFkeSBob2xkaW5n
IHRoZSBsb2NrIHRoZSBleHBvcnRlciB3YW50cyB0byB0YWtlLgoKSG0sIGlzbid0IHRoYXQgcGFw
ZXJlZCBvdmVyIGJ5IHN1Y2ggZXhwb3J0ZXJzIGVuYWJsaW5nIHRoZSBkbWEtYnVmCmNhY2hpbmcg
eW91J3ZlIGp1c3QgbW92ZWQgZnJvbSBkcm1fcHJpbWUgdG8gZG1hLWJ1Zj8KCj4gT24gdGhlIG90
aGVyIGhhbmQgd2UgY291bGQgcmF0aGVyIGVhc2lseSBjaGFuZ2UgdGhhdCBjaGVjayB0bwo+IGRt
YV9idWZfYXR0YWNobWVudF9pc19keW5hbWljKCkgIT0gZG1hX2J1Zl9pc19keW5hbWljKCkgaWYg
dGhhdCBpcwo+IGluZGVlZCBhIHByb2JsZW0uCgpIbSB5ZWFoLgoKPiA+PiArICAgICAgICAgICAg
c3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICBzZ3QgPSBkbWFi
dWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0YWNoLCBETUFfQklESVJFQ1RJT05BTCk7Cj4gPiBBbmQg
dW5mb3J0dW5hdGVseSB0aGUgbm9uLWR5bmFtaWMsIGkuZS4gbGVnYWN5L2N1cnJlbnQgY29kZSBp
bXBvcnRlciBpcwo+ID4gYWxzbyB0aGUgb25lIHdoaWNoIHVzZXMgb3RoZXIgZmxhZ3MgdGhhbiBE
TUFfQklESVJFQ1RJT05BTC4gQXQgbGVhc3Qgb24KPiA+IEFSTSwgYW5kIHRoYXQncyB0aGUgb25s
eSBwbGFjZSB3aGVyZSB0aGlzIG1hdHRlcnMgYmVjYXVzZSB0aGVyZSB0aGUgZG1hCj4gPiBhcGkg
bWlnaHQgZG8gY2FjaGUgZmx1c2hpbmcuCj4KPiBXZWxsIHRoZSBvbmx5IGltcGxlbWVudGVyIGZv
ciBub3cgaXMgYW1kZ3B1LCBhbmQgYW1kZ3B1IGFsd2F5cyByZXF1aXJlcwo+IGEgY29oZXJlbnQg
YmlkaXJlY3Rpb25hbCBtYXBwaW5nLgo+Cj4gU28gdGhpcyB3b24ndCBiZSBhIHByb2JsZW0gdW5s
ZXNzIHRoZSBBUk0gZHJpdmVycyBzdGFydCB0byBpbXBsZW1lbnQKPiBkeW5hbWljIERNQS1idWYg
aGFuZGxpbmcgdGhlbXNlbHZlcyBvciBzdGFydCB0byB0YWxrIHRvIGFtZGdwdSAod2hpY2gKPiB3
b3VsZG4ndCBoYXZlIHdvcmtlZCBiZWZvcmUgYW55d2F5KS4KCkhtLCBmZWVscyBhIGJpdCBldmls
LiBJIGp1c3QgaGVhcmQgYSBzb21lIHNvYyBwZW9wbGUgdGVsbCBtZSB0aGF0IGRybQppc24ndCBj
b29sIGJlY2F1c2UgaXQgbGlrZXMgdG8gaWdub3JlIHNvYyBhdCB0aGUgZXhwZW5zaXZlIG9mIHg4
Ni4KCk90b2ggSSBkb24ndCBzZWUgYSB3YXkgb3V0IGVpdGhlciwgYW5kIG1heWJlIHRoaXMgd2ls
bCBiZSBtb3RpdmF0aW9uCmVub3VnaCB0byBtYWtlIHRoZSBkbWEtYXBpIGNhY2hlIG1hbmFnZW1l
bnQgYSBiaXQgbW9yZSBleHBsaWNpdC4gTm90CnRoYXQgSSBleHBlY3QgbXVjaCBjaGFuZ2UgdGhl
cmUgLi4uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
