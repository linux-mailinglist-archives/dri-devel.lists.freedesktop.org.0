Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6D4CFBC5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C6E6E7BC;
	Tue,  8 Oct 2019 14:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448006E7BC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:00:07 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id i207so6445446ywc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 07:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Cz5Xg/kziLDSnYYuVfabzBlkCNoveK9uLSfeq/wW9Uo=;
 b=tM1xfqX52xKrCltLRMgxIGCtunSjWD0ZfLypcvGPh4ZE2YHCAZxeVKb3sqVgKzG3x2
 lCvbx+Nq+KhLWG1nmElDk36dDevjpEj3jIciw1BMkbhgS6mW6o8vSHO7CrYDMTvlvn6b
 RMpykODGgHAHQ5yWqE4sw0Q5m0fhJhblpnN7OZ4lUwxr/u63zqtkVZ7QfGHa4i0RpBSh
 DBgc6JSag0Y/5QHoIDxtCvf8bIskza2Rfn4srycEnjkhdZD/o/KiEgaRmliOF6sVfJHj
 y0oCuE8jcF+kKu5OHcihEqjWFxlBTeu1jdDYEnnUYz/gBXyM75yKrCsYlu33csuCj1+l
 0lyw==
X-Gm-Message-State: APjAAAWedb4tkXrCR+tRTS0OOp+u54GE1wG17OomaT4Pjf9hsu/WM9t+
 JdzQSnK/9bY4nsIZUTo4lcFkOw==
X-Google-Smtp-Source: APXvYqyCXOJCO2IXWoMeOsYSfXtD8n1wlZ6dVW0wqH0x3YvXEt/mbY1NsaV7KjDi7I0HuAQNr2UBvA==
X-Received: by 2002:a0d:d64c:: with SMTP id y73mr24895253ywd.334.1570543206122; 
 Tue, 08 Oct 2019 07:00:06 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r67sm4849025ywr.48.2019.10.08.07.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 07:00:05 -0700 (PDT)
Date: Tue, 8 Oct 2019 10:00:05 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: damage_helper: Fix race checking plane->state->fb
Message-ID: <20191008140005.GI126146@art_vandelay>
References: <20190904202938.110207-1-sean@poorly.run>
 <CAKMK7uFtcmZd9+wARmYuZwtimUV91fiFXNmr5Nuk4Z65QjHyuA@mail.gmail.com>
 <20190919150401.GV218215@art_vandelay>
 <20191008095033.GJ16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008095033.GJ16989@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Cz5Xg/kziLDSnYYuVfabzBlkCNoveK9uLSfeq/wW9Uo=;
 b=AlhC/2ccACx825p479ug41jCrYtcng14X8Qn9L3NC1eKvSaIkhK3XB2J0NmRTFwjub
 PRiE+dTbjtdAKZjCe/nOEIKU62VNUC2+X4SMXM8qz7eaonSMcPIeqQw7Bjbk4AaJg637
 vEdmoKVvnPS2YruyMSGRz3sST1qjgLkTjQlP+PXPuIOi2Sf7FKWbE8+FzDpuqDF1KyAi
 w63RZTtHuaC5ACwq1q2oDNzAW3jDBQlgbwDkhxowQeKCGNhRb5cRzTXPO9xad5yW8/pc
 BedANZcTwU/wvgYxV9XI/7c67VjNiF16K+jxfR+QucLSikNGMLqd89qzzThY6GfvlLTR
 m7PQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, stable <stable@vger.kernel.org>,
 Deepak Rawat <drawat@vmware.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMTE6NTA6MzNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCAxMTowNDowMUFNIC0wNDAwLCBTZWFuIFBh
dWwgd3JvdGU6Cj4gPiBPbiBUaHUsIFNlcCAwNSwgMjAxOSBhdCAxMjo0MToyN1BNICswMjAwLCBE
YW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDEwOjI5IFBN
IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEZyb206
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gPiA+Cj4gPiA+ID4gU2luY2Ug
dGhlIGRpcnR5ZmIgaW9jdGwgZG9lc24ndCBnaXZlIHVzIGFueSBoaW50cyBhcyB0byB3aGljaCBw
bGFuZSBpcwo+ID4gPiA+IHNjYW5uaW5nIG91dCB0aGUgZmIgaXQncyBtYXJraW5nIGFzIGRhbWFn
ZWQsIHdlIG5lZWQgdG8gbG9vcCB0aHJvdWdoCj4gPiA+ID4gcGxhbmVzIHRvIGZpbmQgaXQuCj4g
PiA+ID4KPiA+ID4gPiBDdXJyZW50bHkgd2UganVzdCByZWFjaCBpbnRvIHBsYW5lIHN0YXRlIGFu
ZCBjaGVjaywgYnV0IHRoYXQgY2FuIHJhY2UKPiA+ID4gPiB3aXRoIGFub3RoZXIgY29tbWl0IGNo
YW5naW5nIHRoZSBmYiBvdXQgZnJvbSB1bmRlciB1cy4gVGhpcyBwYXRjaCBsb2Nrcwo+ID4gPiA+
IHRoZSBwbGFuZSBiZWZvcmUgY2hlY2tpbmcgdGhlIGZiIGFuZCB3aWxsIHJlbGVhc2UgdGhlIGxv
Y2sgaWYgdGhlIHBsYW5lCj4gPiA+ID4gaXMgbm90IGRpc3BsYXlpbmcgdGhlIGRpcnR5IGZiLgo+
ID4gPiA+Cj4gPiA+ID4gRml4ZXM6IGI5ZmM1ZTAxZDFjZSAoImRybTogQWRkIGhlbHBlciB0byBp
bXBsZW1lbnQgbGVnYWN5IGRpcnR5ZmIiKQo+ID4gPiA+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BnbWFpbC5jb20+Cj4gPiA+ID4gQ2M6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+
Cj4gPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiA+
ID4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiA+ID4gPiBD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
PiA+ID4gPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+
ID4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiA+ID4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+ID4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiA+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjArCj4gPiA+ID4gUmVwb3J0
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMgfCA4ICsrKysrKystCj4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4g
Pgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jCj4gPiA+ID4gaW5kZXggODIz
MGRhYzAxYTg5Li4zYTQxMjZkYzI1MjAgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RhbWFnZV9oZWxwZXIuYwo+ID4gPiA+IEBAIC0yMTIsOCArMjEyLDE0IEBAIGludCBkcm1fYXRv
bWljX2hlbHBlcl9kaXJ0eWZiKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAo+ID4gPiA+ICAg
ICAgICAgZHJtX2Zvcl9lYWNoX3BsYW5lKHBsYW5lLCBmYi0+ZGV2KSB7Cj4gPiA+ID4gICAgICAg
ICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOwo+ID4gPiA+Cj4g
PiA+ID4gLSAgICAgICAgICAgICAgIGlmIChwbGFuZS0+c3RhdGUtPmZiICE9IGZiKQo+ID4gPiA+
ICsgICAgICAgICAgICAgICByZXQgPSBkcm1fbW9kZXNldF9sb2NrKCZwbGFuZS0+bXV0ZXgsIHN0
YXRlLT5hY3F1aXJlX2N0eCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gPiA+
IAo+ID4gPiBJIHRoaW5rIGZvciBwYXJhbm9pZCBzYWZldHkgd2Ugc2hvdWxkIGhhdmUgYSBXQVJO
X09OKHJldCA9PSAtRUFMUkVBRFkpCj4gPiA+IGhlcmUuIEl0IHNob3VsZCBiZSBpbXBvc3NpYmxl
LCBidXQgaWYgaXQncyBub3QgZm9yIHNvbWUgb2RkYmFsbAo+ID4gPiByZWFzb24sIHdlJ2xsIGJs
b3cgdXAuCj4gPiAKPiA+IGRybV9tb2Rlc2V0X2xvY2sgZWF0cyBFQUxSRUFEWSBhbmQgcmV0dXJu
cyAwIGZvciB0aGF0IGNhc2UsIHNvIEkgZ3Vlc3MgaXQKPiA+IGRlcGVuZHMgX2hvd18gcGFyYW5v
aWQgeW91IHdhbnQgdG8gYmUgaGVyZSA6LSkKPiAKPiBBaCBzaWxseSBtZSwgci1iIGFzLWlzIHRo
ZW4uCgpUaGFua3MsIHB1c2hlZCB0byAtbWlzYy1uZXh0CgpTZWFuCgo+IC1EYW5pZWwKPiAKPiA+
IAo+ID4gPiAKPiA+ID4gV2l0aCB0aGF0OiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+ID4gPiAKPiA+ID4gQnV0IHBsZWFzZSBnaXZlIHRoaXMgYSBzcGluIHdp
dGggc29tZSB3b3JrbG9hZHMgYW5kIHRoZSB3d19tdXRleAo+ID4gPiBzbG93cGF0aCBkZWJ1Z2dp
bmcgZW5hYmxlZCwganVzdCB0byBtYWtyZSBzdXJlLgo+ID4gCj4gPiBPaywgaGFkIGEgY2hhbmNl
IHRvIHJ1biB0aHJvdWdoIHNvbWUgdGVzdHMgdGhpcyBtb3JuaW5nIHdpdGgKPiA+IENPTkZJR19E
RUJVR19XV19NVVRFWF9TTE9XUEFUSCBhbmQgdGhpbmdzIGxndG0KPiA+IAo+ID4gU2Vhbgo+ID4g
Cj4gPiA+IC1EYW5pZWwKPiA+ID4gCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAocGxhbmUtPnN0YXRl
LT5mYiAhPSBmYikgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9tb2Rlc2V0
X3VubG9jaygmcGxhbmUtPm11dGV4KTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiA+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gICAgICAg
ICAgICAgICAgIHBsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfcGxhbmVfc3RhdGUoc3RhdGUs
IHBsYW5lKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihwbGFuZV9zdGF0ZSkp
IHsKPiA+ID4gPiAtLQo+ID4gPiA+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2ds
ZSAvIENocm9taXVtIE9TCj4gPiA+ID4KPiA+ID4gCj4gPiA+IAo+ID4gPiAtLSAKPiA+ID4gRGFu
aWVsIFZldHRlcgo+ID4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+
ID4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAo+ID4gCj4gPiAt
LSAKPiA+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9T
Cj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBF
bmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
