Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27538591
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C9D89C1B;
	Fri,  7 Jun 2019 07:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3ADF892BC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 19:53:40 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id a186so1973994itg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 12:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvRzAt8oUa+QOs8oktnGNElZis2955KPPjFl8TJj1Sc=;
 b=oaoMCKE2EHPDBxo9QH/dUzAIFnHOb2GqzMhhRMVm4OH4hg0AVAeEUzgiI1F2A53JSL
 gFynjyg1ZjfTlgf1BND1NINhqfh4rQwNjUKDVWZmbHhOQWG+/4dq2RuQMN1lXWHHRO0q
 UWRbSI21wheHRAPXgoWBOFbCVV4mstRcyzfjTXMEwUYGB4C14XvwvQc5/JiUyW1gYBJb
 LsNpWndGFG2XO6GZMygZZw/wcVeSigDph8wM+AR0enGJkk0csG5fuez2MqhVkyxOyk7y
 pHFaxnDK2r6Ylcdydais2+Ktjy8QFyGwGErtLhazwtgvCyOl6gj4rNnxaDBcm7dKI0uY
 BBOA==
X-Gm-Message-State: APjAAAX2UhHX216fILN0gLiNAz3LmbK6MWtiHw3IqPWvzWXNAv2gUrzw
 HNWna6aVcit5U6KA9iZjUHk2G95oJCbRK4Kqi8U=
X-Google-Smtp-Source: APXvYqy7pWNl4Q+X7LS21yrTMp4Kqd7zvq75fu/BksKKF+n8OdJGBkq6cgEp1ESBftQ0uehnGbsNv9eC+vjhoHPBetU=
X-Received: by 2002:a24:97d2:: with SMTP id k201mr1379721ite.151.1559850820180; 
 Thu, 06 Jun 2019 12:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
 <CGME20190605070535epcas2p36fee13315966e45d425c073162aa1aae@epcas2p3.samsung.com>
 <20190605070507.11417-7-andrew.smirnov@gmail.com>
 <28ddfb42-db9a-f095-9230-d324db5ee483@samsung.com>
In-Reply-To: <28ddfb42-db9a-f095-9230-d324db5ee483@samsung.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 6 Jun 2019 12:53:28 -0700
Message-ID: <CAHQ1cqGEe9cT18UNtjkRDACrwYr8YRJ3Ec6eGaR8Qp+-QgqTdQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] drm/bridge: tc358767: Simplify AUX data read
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QvRzAt8oUa+QOs8oktnGNElZis2955KPPjFl8TJj1Sc=;
 b=N+cqBcIV8wCw3ILXUCLZHVe/s4oVuQ8zay6aGrYPCg/Q0/LfbnGZ3xrbjVNC2YrE+E
 gSa1nR+/Nq1cCJ7Jznj/Mh+Brk11hVeOkfmo7Mu9L8hig5pyoGV3hzJCKKy15b2Ux4YT
 zAAWOLCfUwPmGNGUKX5hvU8UhLJUAuxnsWIb0vjJMTLwE9WVVid8S/axVQwSWwX/zwPe
 y0b8JzAyRKGSbTtq2I4s4PrRaPLbKrmGieixcUCvQN3oCK9J8zhbUjhFim3HibPIkckH
 W6ktf0tSNKqYlGcNECmzAZgznIdXds66vzYJebSmZfwWa8gCf3MmmOyqUZ2k3M+KpybO
 +vOA==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCAzOjU5IEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+IHdyb3RlOgo+Cj4gT24gMDUuMDYuMjAxOSAwOTowNCwgQW5kcmV5IFNtaXJub3Yg
d3JvdGU6Cj4gPiBTaW1wbGlmeSBBVVggZGF0YSByZWFkIGJ5IHJlbW92aW5nIGluZGV4IGFyaXRo
bWV0aWMgYW5kIHNoaWZ0aW5nIHdpdGgKPiA+IGEgaGVscGVyIGZ1bmN0aW9ucyB0aGF0IGRvZXMg
dGhyZWUgdGhpbmdzOgo+ID4KPiA+ICAgICAxLiBGZXRjaCBkYXRhIGZyb20gdXAgdG8gNCAzMi1i
aXQgcmVnaXN0ZXJzIGZyb20gdGhlIGNoaXAKPiA+ICAgICAyLiBPcHRpb25hbGx5IGZpeCBkYXRh
IGVuZGlhbm5lc3MgKG5vdCBuZWVkZWQgb24gTEUgaG9zdHMpCj4gPiAgICAgMy4gQ29weSByZWFk
IGRhdGEgaW50byB1c2VyIHByb3ZpZGVkIGFycmF5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+Cj4gPiBDYzogQXJjaGl0IFRh
bmVqYSA8YXJjaGl0dEBjb2RlYXVyb3JhLm9yZz4KPiA+IENjOiBBbmRyemVqIEhhamRhIDxhLmhh
amRhQHNhbXN1bmcuY29tPgo+ID4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWlu
ZW5AdGkuY29tPgo+ID4gQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRl
bWJlZGRlZC5jb20+Cj4gPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KPiA+IENjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5hZXJvPgo+ID4gQ2M6IENocmlz
IEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KPiA+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT4KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5j
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gPiBpbmRleCBlMTk3Y2UwZmIx
NjYuLmRhNDdkODFlNzEwOSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4g
PiBAQCAtMzIxLDYgKzMyMSwyOSBAQCBzdGF0aWMgaW50IHRjX2F1eF9nZXRfc3RhdHVzKHN0cnVj
dCB0Y19kYXRhICp0YywgdTggKnJlcGx5KQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4K
PiA+ICtzdGF0aWMgaW50IHRjX2F1eF9yZWFkX2RhdGEoc3RydWN0IHRjX2RhdGEgKnRjLCB2b2lk
ICpkYXRhLCBzaXplX3Qgc2l6ZSkKPiA+ICt7Cj4gPiArICAgICB1MzIgYXV4cmRhdGFbRFBfQVVY
X01BWF9QQVlMT0FEX0JZVEVTIC8gc2l6ZW9mKHUzMildOwo+ID4gKyAgICAgaW50IHJldCwgaSwg
Y291bnQgPSBESVZfUk9VTkRfVVAoc2l6ZSwgc2l6ZW9mKHUzMikpOwo+ID4gKwo+ID4gKyAgICAg
cmV0ID0gcmVnbWFwX2J1bGtfcmVhZCh0Yy0+cmVnbWFwLCBEUDBfQVVYUkRBVEEoMCksIGF1eHJk
YXRhLCBjb3VudCk7Cj4gPiArICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4gKwo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKPiA+ICsg
ICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICogT3VyIHJlZ21hcCBpcyBjb25maWd1
cmVkIGFzIExFIGZvciByZWdpc3RlciBkYXRhLAo+ID4gKyAgICAgICAgICAgICAgKiBzbyB3ZSBu
ZWVkIHVuZG8gYW55IGJ5dGUgc3dhcHBpbmcgdGhhdCBtaWdodCBoYXZlCj4gPiArICAgICAgICAg
ICAgICAqIGhhcHBlbmVkIHRvIHByZXNlcnZlIG9yaWdpbmFsIGJ5dGUgb3JkZXIuCj4gPiArICAg
ICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICBsZTMyX3RvX2NwdXMoJmF1eHJkYXRhW2ld
KTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIG1lbWNweShkYXRhLCBhdXhyZGF0YSwgc2l6
ZSk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gc2l6ZTsKPiA+ICt9Cj4gPiArCj4KPgo+IEhtbSwg
Y2Fubm90IHdlIGp1c3QgdXNlIHJlZ21hcF9yYXdfcmVhZD8KCkknbGwgZ2l2ZSBpdCBhIHRyeSBp
biB2NC4KClRoYW5rcywKQW5kcmV5IFNtaXJub3YKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
