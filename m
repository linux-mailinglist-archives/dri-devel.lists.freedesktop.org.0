Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DD11F870
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 18:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2D189274;
	Wed, 15 May 2019 16:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A6189274
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 16:23:19 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id m1so317769vsr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 09:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XibrizVK+x4gwJRznLKLxYNtzx6v60+igfS3HoIEayQ=;
 b=jbcYoVdFl6PQ2ONmnr1RdWw0Sb+fotZfFwcmOSJA6npFYV/XluXScHPP12Qbiv5qAm
 ehiEvoG8lYRiw9lF+BTwm4kBpqknAMWPa0y2Icl0krPwS7CWs+fCL4HgkQsObPoTtzgH
 RzY6rHfeY0Rdpdr2A3l+1LTAEBnfj1Hgjw4eV/8GDWHc47vrNCS9l382KpomijSbJgml
 uqz+4IuIJc1gWC/tErQ+fK9op4Q7ubP0gEkuti3ldBEyIUW2MnREpEZsTwZu96D6jgwF
 C3HA2BVEKMM1fMNe4sDzzhPiDWnIMsasFQ8sEVQ5twKQFOiy6zwUg49YMX3aXoYHBAKt
 6ETw==
X-Gm-Message-State: APjAAAUA6Lg4V5qmdhCa5vsaoM37EFCkMvxFOSADprmQS9LCgR5UvfOE
 rG7379ENtKn0eBtiUnNWETaUH3FdHmk=
X-Google-Smtp-Source: APXvYqz7pykQHGjL2QFCMUbu6WMJUFPoy69WcCGygf9epXfM/NoQIXAIHWTg/2nL3LtTgRen4R42iQ==
X-Received: by 2002:a67:6c07:: with SMTP id h7mr18314616vsc.228.1557937397765; 
 Wed, 15 May 2019 09:23:17 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id j63sm864120vke.8.2019.05.15.09.23.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 09:23:10 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id q64so339792vsd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 09:23:09 -0700 (PDT)
X-Received: by 2002:a67:f60b:: with SMTP id k11mr13708286vso.111.1557937389222; 
 Wed, 15 May 2019 09:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190502223808.185180-1-dianders@chromium.org>
In-Reply-To: <20190502223808.185180-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 May 2019 09:22:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2BvvEx+sYji5pGAEwagD6uA20nCMKwiU=kD6FqkSLiw@mail.gmail.com>
Message-ID: <CAD=FV=W2BvvEx+sYji5pGAEwagD6uA20nCMKwiU=kD6FqkSLiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Add hooks for suspend/resume
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XibrizVK+x4gwJRznLKLxYNtzx6v60+igfS3HoIEayQ=;
 b=czft9FTmE5tMVE8dOINVb8LBbsa35P48tLVdr892dOMLRa4VB1coebG0BKnTxX5Cka
 6m1J4wFkHSi7VzolqLIgckMP6rlJbSJD+yfgb6Cih4Pe7Mqr04yeQhzIn8xXjqs0SOoI
 ZmDyr6hSfcx3TYTP7yv3gAaimFJ6Y3azQMq+g=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Matthias Kaehlcke <mka@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkZyb206IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KRGF0ZTog
VGh1LCBNYXkgMiwgMjAxOSBhdCAzOjM4IFBNClRvOiBIZWlrbyBTdHVlYm5lciwgU2FuZHkgSHVh
bmcsIEFuZHJ6ZWogSGFqZGEsIExhdXJlbnQgUGluY2hhcnQKQ2M6IDxsaW51eC1yb2NrY2hpcEBs
aXN0cy5pbmZyYWRlYWQub3JnPiwgTmVpbCBBcm1zdHJvbmcsCjxta2FAY2hyb21pdW0ub3JnPiwg
U2VhbiBQYXVsLCBEb3VnbGFzIEFuZGVyc29uLCBaaGVuZyBZYW5nLCBTYW0KUmF2bmJvcmcsIDxk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiwKPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+LCBWaWxsZSBTeXJqw6Rsw6QsIERhdmlkIEFpcmxpZSwgSmVybmVqClNrcmFiZWMsIERh
bmllbCBWZXR0ZXIKCj4gT24gUm9ja2NoaXAgcmszMjg4LWJhc2VkIENocm9tZWJvb2tzIHdoZW4g
eW91IGRvIGEgc3VzcGVuZC9yZXN1bWUKPiBjeWNsZToKPgo+IDEuIFlvdSBsb3NlIHRoZSBhYmls
aXR5IHRvIGRldGVjdCBhbiBIRE1JIGRldmljZSBiZWluZyBwbHVnZ2VkIGluLgo+Cj4gMi4gSWYg
eW91J3JlIHVzaW5nIHRoZSBpMmMgYnVzIGJ1aWx0IGluIHRvIGR3X2hkbWkgdGhlbiBpdCBzdG9w
cwo+IHdvcmtpbmcuCj4KPiBMZXQncyBhZGQgYSBob29rIHRvIHRoZSBjb3JlIGR3LWhkbWkgZHJp
dmVyIHNvIHRoYXQgd2UgY2FuIGNhbGwgaXQgaW4KPiBkd19oZG1pLXJvY2tjaGlwIGluIHRoZSBu
ZXh0IGNvbW1pdC4KPgo+IE5PVEU6IHRoZSBleGFjdCBzZXQgb2Ygc3RlcHMgSSd2ZSBkb25lIGhl
cmUgaW4gcmVzdW1lIGNvbWUgZnJvbQo+IGxvb2tpbmcgYXQgdGhlIG5vcm1hbCBkd19oZG1pIGlu
aXQgc2VxdWVuY2UgaW4gdXBzdHJlYW0gTGludXggcGx1cyB0aGUKPiBzZXF1ZW5jZSB0aGF0IHdl
IGRpZCBpbiBkb3duc3RyZWFtIENocm9tZSBPUyAzLjE0LiAgVGVzdGluZyBzaG93IHRoYXQKPiBp
dCBzZWVtcyB0byB3b3JrLCBidXQgaWYgYW4gZXh0cmEgc3RlcCBpcyBuZWVkZWQgb3Igc29tZXRo
aW5nIGhlcmUgaXMKPiBub3QgbmVlZGVkIHdlIGNvdWxkIGltcHJvdmUgaXQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4K
PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAyMSArKysrKysr
KysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAg
ICAgfCAgMyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpEaWQgYW55
b25lIGhhdmUgYW55IHRob3VnaHRzIG9uIHRoaXMgcGF0Y2ggc2VyaWVzPyAgVGhhbmtzISAgOi0p
CgotRG91ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
