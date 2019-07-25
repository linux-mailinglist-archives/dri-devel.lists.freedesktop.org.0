Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0037568D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 20:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3421E6E7F7;
	Thu, 25 Jul 2019 18:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAF26E7F7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 18:08:14 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id l79so19522534ywe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 11:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZdBlpQVXQyqMfwxCgcRNBeCk3V6PT3TSwXJlNMqhdlM=;
 b=K32JqNUBxx67heRcj7ZbEpvCJSgouqBgg8RvkwLQyEyiVTLQuH6Un5gLuUxjJnWkNJ
 8+PxGbdmvqC2KuA6pNYMUfTHjsVhpSQm8yq27cwe0SJ/Kwc/x7UUvz3rPyW7O/+9vz+z
 gBLfDwrKYPoMan5MX6yQcDkqrQMhUtC5ZDrf4X2Hn4XHQzJOyok0LLfrYnBnjTZC56dq
 3BiF0WuIrjSp1XuiFEmkq9HjNgH6oejLpnvGzjc6hSMzD6r3v1kBNNWffOS+ne4d1/X7
 XcsLMCcBAH2aII81San8wXsQAeKdhiK8yBGH9XZRorbqgXgBaDKdI2mR7ffA40FXGh2o
 68Zg==
X-Gm-Message-State: APjAAAWZWhWWHQjRrTJS40W4Vry+1zYglGPWsl5Fu4Jb3fVjDLwDpcda
 BfeLaA8yWNKmzxqh0XKOYYdZNw==
X-Google-Smtp-Source: APXvYqxtUnD9zbmyOfpjvoV00ncGJlt2JjQ/lhmc3nNIRJNh/w+Y6jOCmveKUizfwATwsIFjJogZxw==
X-Received: by 2002:a81:3c12:: with SMTP id j18mr56791288ywa.294.1564078093245; 
 Thu, 25 Jul 2019 11:08:13 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id x67sm11662194ywg.70.2019.07.25.11.08.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 11:08:12 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:08:12 -0400
From: Sean Paul <sean@poorly.run>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 07/11] drm/rockchip: Check for fast link training
 before enabling psr
Message-ID: <20190725180812.GO104440@art_vandelay>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-8-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611160844.257498-8-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZdBlpQVXQyqMfwxCgcRNBeCk3V6PT3TSwXJlNMqhdlM=;
 b=NQOtTfdcOGsw4w3s/WHwr0+hMkiZba2jrTEEKC8FWkRl2wZ/mAwum47HxGyDP9dt09
 QBRPxUfh0su2rL1hyU8rSea4Q772lBL3YH0pLlBf63ACfR3aBJZmivW3MkMQAJezc9wI
 QhqNEF9a0zF2/hJ8wV0CfMcapmot9omHZrVQyuoPKWfxzJTBA0dh/5PQHFIosPoU/Ear
 HTVT2hs94HNRSLAII9mbLlTVHUBZ4o3uUZOo+3wckFFd/NSg21n0WwG6Bh3sDkP7lxec
 wyjidgFUL0Beds8CBoiYjoLRvJviTIKhw9hO+WhNAdV+To1UiQFzSSaqX0HRfO23JHWO
 OW7Q==
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
Cc: Zain Wang <wzz@rock-chips.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTI6MDg6MjFQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IE9uY2Ugd2Ug
c3RhcnQgc2h1dHRpbmcgb2ZmIHRoZSBsaW5rIGR1cmluZyBQU1IsIHdlJ3JlIGdvaW5nIHRvIHdh
bnQgZmFzdAo+IHRyYWluaW5nIHRvIHdvcmsuIElmIHRoZSBkaXNwbGF5IGRvZXNuJ3Qgc3VwcG9y
dCBmYXN0IHRyYWluaW5nLCBkb24ndAo+IGVuYWJsZSBwc3IuCj4gCj4gQ2hhbmdlcyBpbiB2MjoK
PiAtIE5vbmUKPiBDaGFuZ2VzIGluIHYzOgo+IC0gTm9uZQo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBO
b25lCj4gQ2hhbmdlcyBpbiB2NToKPiAtIE5vbmUKPiAKPiBMaW5rIHRvIHYxOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTAyMjgyMTA5MzkuODMzODYt
My1zZWFuQHBvb3JseS5ydW4KPiBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTAzMjYyMDQ1MDkuOTY1MTUtMi1zZWFuQHBvb3JseS5y
dW4KPiBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
bXNnaWQvMjAxOTA1MDIxOTQ5NTYuMjE4NDQxLTktc2VhbkBwb29ybHkucnVuCj4gTGluayB0byB2
NDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNTA4
MTYwOTIwLjE0NDczOS04LXNlYW5AcG9vcmx5LnJ1bgo+IAo+IENjOiBaYWluIFdhbmcgPHd6ekBy
b2NrLWNoaXBzLmNvbT4KPiBDYzogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KPiBU
ZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgpASGVpa28sIGNvdWxk
IHlvdSBwbGVhc2UgcmV2aWV3IHBhdGNoZXMgNy0xMT8gSSdtIHdvcnJpZWQgdGhleSdyZSBnb2lu
ZyB0byBzdGFydAp0byByb3QgYW5kIHRoZSBoZWxwZXJzIGhhdmUgYWxyZWFkeSBsYW5kZWQgaW4g
TGludXMnIHRyZWUuCgpUaGFua3MsCgpTZWFuCgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8
c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8IDkgKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKPiBpbmRleCBkMmRlOThk
NDQxODQ1Li5hMDdkMTllMDhiODAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKPiBAQCAtMTA0MCwxNiArMTA0MCwxNyBA
QCBzdGF0aWMgaW50IGFuYWxvZ2l4X2RwX2NvbW1pdChzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2aWNl
ICpkcCkKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gKwkvKiBDaGVjayB3aGV0
aGVyIHBhbmVsIHN1cHBvcnRzIGZhc3QgdHJhaW5pbmcgKi8KPiArCXJldCA9IGFuYWxvZ2l4X2Rw
X2Zhc3RfbGlua190cmFpbl9kZXRlY3Rpb24oZHApOwo+ICsJaWYgKHJldCkKPiArCQlkcC0+cHNy
X2VuYWJsZSA9IGZhbHNlOwo+ICsKPiAgCWlmIChkcC0+cHNyX2VuYWJsZSkgewo+ICAJCXJldCA9
IGFuYWxvZ2l4X2RwX2VuYWJsZV9zaW5rX3BzcihkcCk7Cj4gIAkJaWYgKHJldCkKPiAgCQkJcmV0
dXJuIHJldDsKPiAgCX0KPiAgCj4gLQkvKiBDaGVjayB3aGV0aGVyIHBhbmVsIHN1cHBvcnRzIGZh
c3QgdHJhaW5pbmcgKi8KPiAtCXJldCA9ICBhbmFsb2dpeF9kcF9mYXN0X2xpbmtfdHJhaW5fZGV0
ZWN0aW9uKGRwKTsKPiAtCWlmIChyZXQpCj4gLQkJZHAtPnBzcl9lbmFibGUgPSBmYWxzZTsKPiAg
Cj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gLS0gCj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2lu
ZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
