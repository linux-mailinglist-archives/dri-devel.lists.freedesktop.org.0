Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EDF771A2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 20:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13FF6EE2F;
	Fri, 26 Jul 2019 18:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F596EE2F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 18:52:19 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id j6so11401338ybm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mno7a2U2MvR1HzgEbBg48J5O7RBSs0PH7AT1NSfvV4Y=;
 b=E4HFpV4Tg60Pi4pMiHqZgVo3qxMVmzQ1zzOoZrSbLGJaGzr4jqRzlCjQOdTPUmI6z8
 +46ndF7+nuOpHglPYqAHEntHReo8DblnIsFwXBeL+BX6ndgJ8U/5zslU+nRGBTWR7dNI
 SkQTi7Mff8Ra7FbBlkvTniJHFQ4vxQT3qKFZmPueZtO6kRnjBVeXbTQEem1PX8W3qrcY
 6lmTmZ5zozmADP40PKcPbjeSabAwL4WRhg8ZoZZbCUlJzWfPcXfNbk8L2e1J3wy3vHyE
 J9KrrbzGBnOgpvFg2ohSFVw1lTDRI5G7e7jbrGYQ1JealR9sMTJzGMQbqLe0XvDfdmQE
 DWGg==
X-Gm-Message-State: APjAAAXMXJJNHZEI04Y2pZhWQCkiOlc/4WJpKZDE+ATyD91jHjXyJg6/
 Z+PTXQwTFvZh/teXTpSY+LoX/g==
X-Google-Smtp-Source: APXvYqzwKJ2wReTNAAovjO1WgB5KZ6E9/ev0UzrTveNvAOvG7HeE+W9KwWGCb90ngt7Mogf3dHOvVQ==
X-Received: by 2002:a25:5e09:: with SMTP id s9mr55042656ybb.416.1564167138271; 
 Fri, 26 Jul 2019 11:52:18 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 206sm12609754ywk.44.2019.07.26.11.52.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 11:52:17 -0700 (PDT)
Date: Fri, 26 Jul 2019 14:52:17 -0400
From: Sean Paul <sean@poorly.run>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 07/11] drm/rockchip: Check for fast link training
 before enabling psr
Message-ID: <20190726185217.GP104440@art_vandelay>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-8-sean@poorly.run>
 <20190725180812.GO104440@art_vandelay> <3530881.Ri8gbRaMhX@phil>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3530881.Ri8gbRaMhX@phil>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mno7a2U2MvR1HzgEbBg48J5O7RBSs0PH7AT1NSfvV4Y=;
 b=bThj3CJ9yt0x9C1Tta4+oNbB+gohfkDWG4Dd4I+yv4uflZLTj0jymZVXQKuNqABxXg
 DYr8ZVkV+ZumfortIdWkI8eB0/CiUHDAcBwO+ZbCJDZ6qS/TsEKaKAjiOZuFAbcnzFjT
 nEOb+HFH1T98bMFz/gykrz0kJ+oRESd7/jgffJ2M75mPN3DZZ2aQtPIFfrHM1vgwIK9R
 SPwp1Fe8sQPQAzEA3Cg5rKsrZl6hxc7ghMKKZMoAk9opXOw5mzxvEUpFjOHLAyHZIB5F
 n/41/iac9+rZecgUlwH4/db1O1SfvdPrQbZyjgMLZ9CCDYT3oc7xauWRKtnwAWZ5xJLN
 BTqA==
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDg6Mzk6NDJQTSArMDIwMCwgSGVpa28gU3R1ZWJuZXIg
d3JvdGU6Cj4gSGkgU2VhbiwKPiAKPiBBbSBEb25uZXJzdGFnLCAyNS4gSnVsaSAyMDE5LCAyMDow
ODoxMiBDRVNUIHNjaHJpZWIgU2VhbiBQYXVsOgo+ID4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQg
MTI6MDg6MjFQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3RlOgo+ID4gPiBGcm9tOiBTZWFuIFBhdWwg
PHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+ID4gCj4gPiA+IE9uY2Ugd2Ugc3RhcnQgc2h1dHRp
bmcgb2ZmIHRoZSBsaW5rIGR1cmluZyBQU1IsIHdlJ3JlIGdvaW5nIHRvIHdhbnQgZmFzdAo+ID4g
PiB0cmFpbmluZyB0byB3b3JrLiBJZiB0aGUgZGlzcGxheSBkb2Vzbid0IHN1cHBvcnQgZmFzdCB0
cmFpbmluZywgZG9uJ3QKPiA+ID4gZW5hYmxlIHBzci4KPiA+ID4gCj4gPiA+IENoYW5nZXMgaW4g
djI6Cj4gPiA+IC0gTm9uZQo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAtIE5vbmUKPiA+ID4g
Q2hhbmdlcyBpbiB2NDoKPiA+ID4gLSBOb25lCj4gPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiA+IC0g
Tm9uZQo+ID4gPiAKPiA+ID4gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwMjI4MjEwOTM5LjgzMzg2LTMtc2VhbkBwb29ybHkucnVu
Cj4gPiA+IExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC9tc2dpZC8yMDE5MDMyNjIwNDUwOS45NjUxNS0yLXNlYW5AcG9vcmx5LnJ1bgo+ID4gPiBMaW5r
IHRvIHYzOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAx
OTA1MDIxOTQ5NTYuMjE4NDQxLTktc2VhbkBwb29ybHkucnVuCj4gPiA+IExpbmsgdG8gdjQ6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDUwODE2MDky
MC4xNDQ3MzktOC1zZWFuQHBvb3JseS5ydW4KPiA+ID4gCj4gPiA+IENjOiBaYWluIFdhbmcgPHd6
ekByb2NrLWNoaXBzLmNvbT4KPiA+ID4gQ2M6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5v
cmc+Cj4gPiA+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiA+
IAo+ID4gQEhlaWtvLCBjb3VsZCB5b3UgcGxlYXNlIHJldmlldyBwYXRjaGVzIDctMTE/IEknbSB3
b3JyaWVkIHRoZXkncmUgZ29pbmcgdG8gc3RhcnQKPiA+IHRvIHJvdCBhbmQgdGhlIGhlbHBlcnMg
aGF2ZSBhbHJlYWR5IGxhbmRlZCBpbiBMaW51cycgdHJlZS4KPiAKPiBJIGRpZCBsb29rIHRocm91
Z2ggdGhlIHBhdGNoZXMgYW5kIG5vdGhpbmcgb3V0IG9mIHRoZSBvcmRpbmFyeSBzcHJhbmcKPiBv
dXQgdG8gbXkgKHNvbWV3aGF0IHVudHJhaW5lZCkgZXllIGFuZCBqdWRnaW5nIGJ5IG15IHRlc3Rl
ZC10YWdzIEkgYWxzbwo+IGdhdmUgdGhlbSBhIHNwaW4gYXQgc29tZSBwb2ludCAtIGFsdGhvdWdo
IGl0IHNlZW1zIEkgbmV2ZXIgd2FzIGFjdHVhbGx5IG9uCj4gY2MgZm9yIHRoZW0uCj4gCj4gSW4g
YW55IGNhc2UgdGhleSBsb29rIGdvb2QgdG8gbWUsIHNvIGlmIGl0IGhlbHBzIHlvdSwgeW91IGNh
biBhZGQgbXkKPiAJUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+
Cj4gdGhvdWdoIHNob3VsZCB0YWtlIHRoZSB0ZWNobmljYWwgZXhwZXJ0aXNlIG9uIGRybS1pbnRl
cm5hbHMgd2l0aCBhCj4gZ3JhaW4gb2Ygc2FsdC4KClRoYW5rcyBIZWlrbyEgR2l2ZW4gaG93IGxv
bmcgdGhpcyBoYXMgYmVlbiBvbiB0aGUgbGlzdCBhbmQgdGhhdCBib3RoIHlvdSBhbmQgSQpoYXZl
IHRlc3RlZCBpdCwgSSd2ZSBwdXNoZWQgaXQgdG8gZHJtLW1pc2MtbmV4dCB3aXRoIHlvdXIgUi1i
LiBJJ2xsIGtlZXAgYW4gZXllCm9uIHRoaW5ncyBhcyBpdCByb2xscyBvdXQgYW5kIGhvcGVmdWxs
eSBldmVyeXRoaW5nIHdpbGwgZ28gc21vb3RobHkuCgpTZWFuCgo+IAo+IAo+IEhlaWtvCj4gCj4g
Cj4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXhfZHBfY29yZS5jIHwgOSArKysrKy0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwo+ID4gPiBpbmRleCBkMmRl
OThkNDQxODQ1Li5hMDdkMTllMDhiODAzIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwo+ID4gPiBAQCAtMTA0
MCwxNiArMTA0MCwxNyBAQCBzdGF0aWMgaW50IGFuYWxvZ2l4X2RwX2NvbW1pdChzdHJ1Y3QgYW5h
bG9naXhfZHBfZGV2aWNlICpkcCkKPiA+ID4gIAlpZiAocmV0KQo+ID4gPiAgCQlyZXR1cm4gcmV0
Owo+ID4gPiAgCj4gPiA+ICsJLyogQ2hlY2sgd2hldGhlciBwYW5lbCBzdXBwb3J0cyBmYXN0IHRy
YWluaW5nICovCj4gPiA+ICsJcmV0ID0gYW5hbG9naXhfZHBfZmFzdF9saW5rX3RyYWluX2RldGVj
dGlvbihkcCk7Cj4gPiA+ICsJaWYgKHJldCkKPiA+ID4gKwkJZHAtPnBzcl9lbmFibGUgPSBmYWxz
ZTsKPiA+ID4gKwo+ID4gPiAgCWlmIChkcC0+cHNyX2VuYWJsZSkgewo+ID4gPiAgCQlyZXQgPSBh
bmFsb2dpeF9kcF9lbmFibGVfc2lua19wc3IoZHApOwo+ID4gPiAgCQlpZiAocmV0KQo+ID4gPiAg
CQkJcmV0dXJuIHJldDsKPiA+ID4gIAl9Cj4gPiA+ICAKPiA+ID4gLQkvKiBDaGVjayB3aGV0aGVy
IHBhbmVsIHN1cHBvcnRzIGZhc3QgdHJhaW5pbmcgKi8KPiA+ID4gLQlyZXQgPSAgYW5hbG9naXhf
ZHBfZmFzdF9saW5rX3RyYWluX2RldGVjdGlvbihkcCk7Cj4gPiA+IC0JaWYgKHJldCkKPiA+ID4g
LQkJZHAtPnBzcl9lbmFibGUgPSBmYWxzZTsKPiA+ID4gIAo+ID4gPiAgCXJldHVybiByZXQ7Cj4g
PiA+ICB9Cj4gPiAKPiA+IAo+IAo+IAo+IAo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5n
aW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
