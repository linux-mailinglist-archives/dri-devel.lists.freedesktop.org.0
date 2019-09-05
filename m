Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E9A9C5F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727AB89FA7;
	Thu,  5 Sep 2019 07:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF12F89FA7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 07:56:29 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g16so1213917otp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 00:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=msH2W/G+P+GY3+ew5Wl/ndRAeTOh5II8J6hkfmwgbfw=;
 b=bC6KAkQh6ofeyFjp+MbPdeDhK/AYATd2VzBKX6I+K4mxLEdVLuEZqH6ucKtLHizYuG
 EVXz7CeyqFP+qtRGjuLV/TrxIESSI6sP6eUkj8KlaPiEcEjJgcTsV/O8oIY38Jf4MbjN
 GgfzCTgVFRLpvQR0ejUHwrM/9fwSeOKWgdXML7Yj+qao+Vm0HNxtwqAukz63/2MU4rA2
 SXyfb2t9d1fsqWVGoZQMetrzA57PVx4DHEzMkIFHar17WNeR71skNevT3+RNMmCIXE+i
 pdInFqODUtaXng5L5KswIOrCSaAE+gL9yn+47BhiLJVs+jqPxx7SN1OEmWLppCjgeaxB
 Ghdw==
X-Gm-Message-State: APjAAAW1EZQbYeJ1T9PEIOWKBjGBB+v5YM6hQuY6lLztrYftk3JjS7A/
 XeyG6B3OM60+lwlq4nzF3Lfu1yF8pNBGvywYnOpE41o6
X-Google-Smtp-Source: APXvYqzZSDJwwTTEbXH1eex+bpmEIw8Q/kL/I9k3BT8U4TTFBp2A8cfykYoFIvwsQ1KbdLtO5lpvr8XQrYY0X6DsesE=
X-Received: by 2002:a05:6830:10d8:: with SMTP id
 z24mr1456471oto.281.1567670188941; 
 Thu, 05 Sep 2019 00:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
 <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
In-Reply-To: <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Sep 2019 09:56:17 +0200
Message-ID: <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ast,
 mgag200: Map console BO while it's being displayed
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=msH2W/G+P+GY3+ew5Wl/ndRAeTOh5II8J6hkfmwgbfw=;
 b=Wgfr/TiTZAN4XmO4N3AJE3Rl4Up940lS0XrfqFyiZZ552GabszAw/jut7DIBfDQN5V
 A49ZlCSK/AxX1K+4gqmjvB9sU4iY1sGIS+jsjtvpEQY6w5QWgIpM+Ns68ATSevurIxy/
 6jOg5IAUphME06RzdDTP9rzTE1k1wWpWduXhI=
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
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCA5OjAxIEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+ICAgSGksCj4KPiA+IC0gaW1vIHdlIHNob3VsZCBmaXggdGhpcyBi
eSB1c2luZyB0aGUgaW9fbWFwcGluZyBzdHVmZiwgdGhhdCBhdm9pZHMKPiA+IHRoZSBvdmVyaGVh
ZCBvZiByZXBlYXRlZCBwYXQgY2hlY2tzIGZvciBtYXAvdW5tYXAuCj4KPiBBbm90aGVyIGlkZWE6
ICBJSVJDIHR0bSBoYXMgYSBtb3ZlX25vdGlmeSBjYWxsYmFjay4gIFNvIHdlIGNvdWxkIHNpbXBs
eQo+IGtlZXAgbWFwcGluZ3MgYWN0aXZlIGV2ZW4gd2hlbiB0aGUgcmVmY291bnQgZ29lcyBkb3du
IHRvIHplcm8uICBUaGVuIGRvCj4gdGhlIGFjdHVhbCB1bm1hcCBlaXRoZXIgaW4gdGhlIG1vdmVf
bm90aWZ5IG9yIGluIHRoZSBkZXN0cm95IGNhbGxiYWNrLgoKWWVhaCB0aGF0IHNob3VsZCBiZSBh
IHJlYWxseSBjbGVhbiBzb2x1dGlvbiwgYW5kIG9ubHkgbmVlZHMgY2hhbmdlcyBpbgp0aGUgdnJh
bSBoZWxwZXJzLiBXaGljaCBpcyBuaWNlLCBtb3JlIGNvbW1vbiBjb2RlIQotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
