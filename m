Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523AE19DBD8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 18:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566E46E165;
	Fri,  3 Apr 2020 16:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084DF6E165
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 16:39:02 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id t28so7898822ott.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UZYWD1ZsX+gJl61EogG2lRd8K9twFHpGvwiYgK2kQPU=;
 b=bqHrShBIP/CxAMEMkEuX2RXMNuIS9+IIYrmpxDaPc1wLd2hoFJxZkQ3zOZJsitrcCg
 +rkSPNZDE/kOrjsgdeD/tVb8YkZ8AH2xopOOe1EIKuXi3dqNaTJt8pvHtDqe5cdtcU8M
 KcZHbkj0nNK5OUEwh2At0Q9R+JIjwm38mu5t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UZYWD1ZsX+gJl61EogG2lRd8K9twFHpGvwiYgK2kQPU=;
 b=h5rFA5eURxOIhk/Iu7npO8/4oGOzKLRjg1ytWQvt9qOWcnF8kcLvVZtZcv70Ppm/wB
 URzBIX2Zyj7OMMnynTnDjRW3R/KibR7gzxgPNGjQ9k19hNpfWGMoCX5u3seuLzSu3lm3
 apOo5sPHGOICjrpsnzsWiUynPK55bambYgyptDBClfNesbWab1R1aquf5zB7hCPX5bJy
 0XWFd8Yt8YpHKy5/YKSXN3upgooxmZ2Rgdyw/FPVaaVMLthPtCPSMVZA+p/4n6WnDBIc
 K10OL5qmybuMYw2mJ3DMiJhMvDtkoiQPKk1k43NbebvrFJt49FWLKr6vXIBuh1C2uVAJ
 X0GQ==
X-Gm-Message-State: AGi0PubidAQouv/jted9AcsUrUTDocH2P1L6pOLinNJcNXBLz4I/tghX
 lAsuVmWFKifx8WfLdZLn+ckKIp2rUMkpk0kZNgcoIfxg
X-Google-Smtp-Source: APiQypIy3Mo5CIPN/93CjHwiWGajBNWkCam78qn8gr+V8n3sh79fszBS11BXrdZt4I0DzPILqHrZdlViuPZcMMP9kHY=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr7485747otr.188.1585931941059; 
 Fri, 03 Apr 2020 09:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <9bef42f5-2f6e-a102-917d-7c55f2bf83d4@daenzer.net>
In-Reply-To: <9bef42f5-2f6e-a102-917d-7c55f2bf83d4@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Apr 2020 18:38:49 +0200
Message-ID: <CAKMK7uHxtvd4=POpBEPNfimjpz6Q7AO4P_XWsgd0fiLN8G1bUA@mail.gmail.com>
Subject: Re: amdgpu dropping load callback triggers WARN_ON in
 __drm_mode_object_add
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMywgMjAyMCBhdCA2OjMwIFBNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+IHdyb3RlOgo+Cj4KPiBJJ20gZ2V0dGluZyB0aGUgYXR0YWNoZWQgV0FSTklORyBz
cGxhdHMgc2luY2UgYW1kZ3B1IGRyb3BwZWQgaXRzIGxvYWQKPiBjYWxsYmFjay4gVGhleSdyZSBm
cm9tCj4KPiAgICAgICAgIFdBUk5fT04oIWRldi0+ZHJpdmVyLT5sb2FkICYmIGRldi0+cmVnaXN0
ZXJlZCAmJiAhb2JqX2ZyZWVfY2IpOwo+Cj4gaW4gX19kcm1fbW9kZV9vYmplY3RfYWRkLgo+Cj4g
SSdtIG5vdCBzdXJlIGhvdyB0byBhZGRyZXNzIHRoaXMsIHNpbmNlIG9ial9mcmVlX2NiIGlzIGFs
d2F5cyBOVUxMIGhlcmUsCj4gYW5kIEkgZG9uJ3QgdGhpbmsgTVNUIGNvbm5lY3RvcnMgZ2V0dGlu
ZyBhZGRlZCBhZnRlciBkZXYtPnJlZ2lzdGVyZWQgaXMKPiBzZXQgY2FuIGJlIGF2b2lkZWQ/CgpJ
IG5lZWQgdGhlIGZ1bGwgc3BsYXQsIG90aGVyd2lzZSBjYW4ndCB0ZWxsIHlvdSB3aGF0J3MgZ29p
bmcgd3JvbmcuClRoZXJlJ3MgMiBjYXNlczoKCi0gaG90cGx1Z2dhYmxlIHN0dWZmLCB3aGljaCBo
YXMgdGhlIG9ial9mcmVlX2NiIHNldC4gRXNzZW50aWFsbHkgTVNUIGNvbm5lY3RvcnMuCgotIG5v
dC1ob3RwbHVnZ2FibGUgc3R1ZmYsIHdoaWNoIGlzIGV2ZXJ5dGhpbmcgZWxzZS4gVGhleSBkb24n
dCBoYXZlCm9ial9mcmVlX2NiIHNldC4gSXQncyBhIGRyaXZlciBidWcgdG8gcmVnaXN0ZXIgdGhv
c2UgYWZ0ZXIgdGhlIG92ZXJhbGwKZHJtX2RldmljZSBoYXMgYWxyZWFkeSBiZWVuIHJlZ2lzdGVy
ZWQgYW5kIHB1Ymxpc2hlZCB0byB1c2Vyc3BhY2UuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
