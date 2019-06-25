Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8982B55489
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 18:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ED16E167;
	Tue, 25 Jun 2019 16:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED99D6E167
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:33:08 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id u19so563648ior.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwY+oa4CU+2jLrCTvWh4nbvrkKnM/pKWMZeBvxC7ZU0=;
 b=GWINeioJMQm/0gEmKMwJbWJoSqmWEuAXhnFdmBKWrRgMRi0RcyfZ9hB+3WTWDSdNxO
 36ZKWS/se142nXggz56/0ILc9jHUSTkVyJ1FMGSUNMjzdU7qciLuZpOBHdmiqaQWrCsY
 Z16jq8fWDR0HKtMFuS5NSMUy0/yrVfqgQQX9Ysf44wd2vbvFcZIJfXt7jcfSEmPrGHdO
 frLp6f9wl8CO4szavQfS9esmUArOzcyE+ZFuUM9e9GWm051+aIELbKMuvye9duEG2S40
 cxUnwMgEpplOrjj+JeYbtx5vrKs40J9TlBemfnqhQYLHqG+hNZ8wjiCHTLUj/rKiZIVO
 6rUg==
X-Gm-Message-State: APjAAAXpWMI0ewN7jt8XBYXib/1HofvD8suf4vLBR5dYgjrpoCthnGTv
 Y6n2hFglbcUiMNrf3QzV85L/vuShXk8=
X-Google-Smtp-Source: APXvYqys6giexZ9VmfmHoX94gmNiIZPy5EkAxdoUZe5GaXQRhjr0uUtdKrnrHKoqSgJjnU2Dr2ZRLw==
X-Received: by 2002:a05:6638:201:: with SMTP id
 e1mr32970264jaq.45.1561480387970; 
 Tue, 25 Jun 2019 09:33:07 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id h19sm17227428iol.65.2019.06.25.09.33.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:33:07 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id k8so1712947iot.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:33:07 -0700 (PDT)
X-Received: by 2002:a6b:5103:: with SMTP id f3mr7084335iob.142.1561480003100; 
 Tue, 25 Jun 2019 09:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190619211151epcas3p4dbb163c034afa4063869c761b93e24b1@epcas3p4.samsung.com>
 <20190619210718.134951-1-dianders@chromium.org>
 <bec87373-48cc-0c55-9662-a74a7d2a47a0@samsung.com>
In-Reply-To: <bec87373-48cc-0c55-9662-a74a7d2a47a0@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Jun 2019 09:26:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJBkYfRznh6aAyvgKgHb8-AG0hMORdKA0BXCL89wG_7w@mail.gmail.com>
Message-ID: <CAD=FV=WJBkYfRznh6aAyvgKgHb8-AG0hMORdKA0BXCL89wG_7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge/synopsys: dw-hdmi: Handle audio for
 more clock rates
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gwY+oa4CU+2jLrCTvWh4nbvrkKnM/pKWMZeBvxC7ZU0=;
 b=UnAYvApESHYhIZR/6fC9tpaOr5kt+ZnKyBE9mrQhqGpqI2byLeJRHdhAOAAgquPl1T
 HbDW11YvB3zM5qCXzEXKmtW4ZCBN6EK+1UjFx+KwSt8v0elkLfQ0eK3KSju0odSDKVlW
 bKPaxgduKYKyR8eFnQWp8Tn2593l1UvURVSt8=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dylan Reid <dgreid@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgoKT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgOTowNyBBTSBBbmRyemVqIEhhamRhIDxhLmhh
amRhQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IE9uIDE5LjA2LjIwMTkgMjM6MDcsIERvdWdsYXMg
QW5kZXJzb24gd3JvdGU6Cj4gPiBMZXQncyBhZGQgc29tZSBiZXR0ZXIgc3VwcG9ydCBmb3IgSERN
SSBhdWRpbyB0byBkd19oZG1pLgo+ID4gU3BlY2lmaWNhbGx5Ogo+ID4KPiA+IDEuIEZvciA0NC4x
IGtIeiBhdWRpbyB0aGUgb2xkIGNvZGUgbWFkZSB0aGUgYXNzdW1wdGlvbiB0aGF0IGFuIE4gb2YK
PiA+IDYyNzIgd2FzIHJpZ2h0IG1vc3Qgb2YgdGhlIHRpbWUuICBUaGF0IHdhc24ndCB0cnVlIGFu
ZCB0aGUgbmV3IHRhYmxlCj4gPiBzaG91bGQgcGljayBhIG1vcmUgaWRlYWwgdmFsdWUuCj4KPgo+
IFdoeT8gSSBhc2sgYmVjYXVzZSBpdCBpcyBhZ2FpbnN0IHJlY29tbWVuZGF0aW9uIGZyb20gSERN
SSBzcGVjcy4KClRoZSBwbGFjZSB3aGVyZSBpdCBkb2VzIG1hdHRlciAoYW5kIHdoeSBJIG9yaWdp
bmFsbHkgZGlkIHRoaXMgd29yaykgaXMKd2hlbiB5b3UgZG9uJ3QgaGF2ZSBhdXRvLUNUUy4gIElu
IHN1Y2ggYSBjYXNlIHlvdSByZWFsbHkgbmVlZCAiTiIgYW5kCiJDVFMiIHRvIG1ha2UgdGhlIG1h
dGggd29yayBhbmQgYm90aCBiZSBpbnRlZ3JhbC4gIFRoaXMgbWFrZXMgc3VyZQp0aGF0IHlvdSBk
b24ndCBzbG93bHkgYWNjdW11bGF0ZSBvZmZzZXRzLiAgSSdtIGhvcGluZyB0aGF0IHRoaXMgcG9p
bnQKc2hvdWxkIGJlIG5vbi1jb250cm92ZXJzaWFsIHNvIEkgd29uJ3QgYXJndWUgaXQgbW9yZS4K
CkkgYW0gYW4gYWRtaXR0ZWQgbm9uLWV4cGVydCwgYnV0IEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCB3
aXRoIEF1dG8tQ1RTCmVpdGhlciB0aGUgb2xkIG51bWJlciBvciB0aGUgbmV3IG51bWJlcnMgd291
bGQgcHJvZHVjZSBwcmV0dHkgbXVjaCB0aGUKc2FtZSBleHBlcmllbmNlLiAgQUtBOiBhbnlvbmUg
dXNpbmcgYXV0by1DVFMgd29uJ3Qgbm90aWNlIGFueSBjaGFuZ2UKYXQgYWxsLiAgSSBndWVzcyB0
aGUgcXVlc3Rpb24gaXM6IHdpdGggQXV0by1DVFMgc2hvdWxkIHlvdSBwaWNrIHRoZQoiaWRlYWwi
IDYyNzIgb3IgYSB2YWx1ZSB0aGF0IGFsbG93cyBDVFMgdG8gYmUgdGhlIGNsb3Nlc3QgdG8gaW50
ZWdyYWwKYXMgcG9zc2libGUuICBCeSByZWFkaW5nIGJldHdlZW4gdGhlIGxpbmVzIG9mIHRoZSBz
cGVjLCBJIGRlY2lkZWQgdGhhdAppdCB3YXMgc2xpZ2h0bHkgbW9yZSBpbXBvcnRhbnQgdG8gYWxs
b3cgZm9yIGFuIGludGVncmFsIENUUy4gIElmCmFjaGlldmluZyBhbiBpbnRlZ3JhbCBDVFMgd2Fz
bid0IGEgZ29hbCB0aGVuIHRoZSBzcGVjIHdvdWxkbid0IGV2ZW4KaGF2ZSBsaXN0ZWQgc3BlY2lh
bCBjYXNlcyBmb3IgYW55IG9mIHRoZSBjbG9jayByYXRlcy4gIFdlIHdvdWxkIGp1c3QKYmUgdXNp
bmcgdGhlIGlkZWFsIE4gYW5kIEF1dG8tQ1RTIGFuZCBiZSBkb25lIHdpdGggaXQuICBUaGUgd2hv
bGUKcG9pbnQgb2YgdGhlIHRhYmxlcyB0aGV5IGxpc3QgaXMgdG8gbWFrZSBDVFMgaW50ZWdyYWwu
CgoKPiA+IDIuIFRoZSBuZXcgdGFibGUgaGFzIHZhbHVlcyBmcm9tIHRoZSBIRE1JIHNwZWMgZm9y
IDI5NyBNSHogYW5kIDU5NAo+ID4gTUh6Lgo+ID4KPiA+IDMuIFRoZXJlIGlzIG5vdyBjb2RlIHRv
IHRyeSB0byBjb21lIHVwIHdpdGggYSBtb3JlIGlkZWEgTi9DVFMgZm9yCj4gPiBjbG9jayByYXRl
cyB0aGF0IGFyZW4ndCBpbiB0aGUgdGFibGUuICBUaGlzIGNvZGUgaXMgYSBiaXQgc2xvdyBiZWNh
dXNlCj4gPiBpdCBpdGVyYXRlcyBvdmVyIGV2ZXJ5IHBvc3NpYmxlIHZhbHVlIG9mIE4gYW5kIHBp
Y2tzIHRoZSBiZXN0IG9uZSwgYnV0Cj4gPiBpdCBzaG91bGQgbWFrZSBhIGdvb2QgZmFsbGJhY2su
Cj4gPgo+ID4gTk9URVM6Cj4gPiAtIFRoZSBvZGRlc3QgcGFydCBvZiB0aGlzIHBhdGNoIGNvbWVz
IGFib3V0IGJlY2F1c2UgY29tcHV0aW5nIHRoZQo+ID4gICBpZGVhbCBOL0NUUyBtZWFucyBrbm93
aW5nIHRoZSBfZXhhY3RfIGNsb2NrIHJhdGUsIG5vdCBhIHJvdW5kZWQKPiA+ICAgdmVyc2lvbiBv
ZiBpdC4gIFRoZSBkcm0gZnJhbWV3b3JrIG1ha2VzIHRoaXMgaGFyZGVyIGJ5IHJvdW5kaW5nCj4g
PiAgIHJhdGVzIHRvIGtIeiwgYnV0IGV2ZW4gaWYgaXQgZGlkbid0IHRoZXJlIG1pZ2h0IGJlIGNh
c2VzIHdoZXJlIHRoZQo+ID4gICBpZGVhbCByYXRlIGNvdWxkIG9ubHkgYmUgY2FsY3VsYXRlZCBp
ZiB3ZSBrbmV3IHRoZSByZWFsCj4gPiAgIChub24taW50ZWdyYWwpIHJhdGUuICBUaGlzIG1lYW5z
IHRoYXQgaW4gY2FzZXMgd2hlcmUgd2Uga25vdyAob3IKPiA+ICAgYmVsaWV2ZSkgdGhhdCB0aGUg
dHJ1ZSByYXRlIGlzIHNvbWV0aGluZyBvdGhlciB0aGFuIHRoZSByYXRlIHdlIGFyZQo+ID4gICB0
b2xkIGJ5IGRybS4KPiA+IC0gVGhpcyBwYXRjaCBtYWtlcyBtdWNoIGxlc3Mgb2YgYSBkaWZmZXJl
bmNlIGFmdGVyIHRoZSBwYXRjaAo+ID4gICAoImRybS9icmlkZ2U6IGR3LWhkbWk6IFVzZSBhdXRv
bWF0aWMgQ1RTIGdlbmVyYXRpb24gbW9kZSB3aGVuIHVzaW5nCj4gPiAgIG5vbi1BSEIgYXVkaW8i
KSwgYXQgbGVhc3QgaWYgeW91J3JlIHVzaW5nIEkyUyBhdWRpby4gIFRoZSBtYWluIGdvYWwKPiA+
ICAgb2YgcGlja2luZyBhIGdvb2QgTiBpcyB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGdldCBhIG5p
Y2UgaW50ZWdyYWwKPiA+ICAgQ1RTIHZhbHVlLCBidXQgaWYgQ1RTIGlzIGF1dG9tYXRpYyB0aGVu
IHRoYXQncyBtdWNoIGxlc3MgY3JpdGljYWwuCj4KPgo+IEFzIEkgc2FpZCBhYm92ZSBIRE1JIHJl
Y29tbWVuZGF0aW9ucyBhcmUgZGlmZmVyZW50IGZyb20gdGhvc2UgZnJvbSB5b3VyCj4gcGF0Y2gu
IFBsZWFzZSBlbGFib3JhdGUgd2h5Pwo+Cj4gQnR3IEkndmUgc2VlbiB5b3VyIG9sZCBwYXRjaGVz
IGludHJvZHVjaW5nIHJlY29tbWVuZGVkIE4vQ1RTIGNhbGN1bGF0aW9uCj4gaGVscGVycyBpbiBI
RE1JIGZyYW1ld29yaywgdW5mb3J0dW5hdGVseSBhYmFuZG9uZWQgZHVlIHRvIGxhY2sgb2YgaW50
ZXJlc3QuCj4KPiBNYXliZSByZXN1cnJlY3RpbmcgdGhlbSB3b3VsZCBiZSBhIGdvb2QgaWRlYSwg
d2l0aCBhc3N1bXB0aW9uIHRoZXJlIHdpbGwKPiBiZSB1c2VycyA6KQoKSSBoYXZlIG9sZCBwYXRj
aGVzIGludHJvZHVjaW5nIHRoaXMgaW50byB0aGUgSERNSSBmcmFtZXdvcms/ICBJIGRvbid0CnJl
bWVtYmVyIHRoZW0gLyBjYW4ndCBmaW5kIHRoZW0uICBDYW4geW91IHByb3ZpZGUgYSBwb2ludGVy
PwoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
