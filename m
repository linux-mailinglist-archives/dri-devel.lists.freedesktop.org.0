Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE75164758
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343076E7EF;
	Wed, 19 Feb 2020 14:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD536EC0B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:43:55 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r16so366973otd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 06:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0+r/IxJFrHXvbsJ7Lw6LBNQtd5OOT3On2BoQEMsYzxc=;
 b=g3/Ul/pC00V3oEf9+jMnYuni1ix46TAfWjiM5mUoqPed3jovuOxpnZiltZsXWKwyQ6
 v3+MD6bymdT6NgOU3+5t9hm5dNSFWyT6kZM73i8fr45EOvS5CRE0+Ge3HBXDLcL8RmtQ
 VTtvtWPkL1s1hmCCB7vxKvrvaVqAfYk5Q7s+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0+r/IxJFrHXvbsJ7Lw6LBNQtd5OOT3On2BoQEMsYzxc=;
 b=SSPWl4czPE1XQMUfUQovibHA0uBCxwTNAyRlKJRIVh8WWfrWwIqKsxDFa5nlJtOL/l
 jyMMxWTlxNn/X+QyVJ7m6ubl6deMsqhB2aWOP+z6hB9JvoU9U0ZNqtdfNXuTrpSMVUZ2
 5VlEyczgGKRjXk5xaSTik7SNaGqTuT7474WI+PJuHmwP2EGPo48J1tciArAFi+h0ZYg5
 Qd/YSrc27etm91bX2yxO/nBhdmZJbXrp9njtXFxbHS5BxIS9Mn6W6V016xZj9zhzEAWF
 n+YxNjmCV5B0iuPMqw9tZ1v9sjyiLFYaZJlAWn3Iq2nGQHp1X6OYoJvFykho7lS/nCmk
 7iWQ==
X-Gm-Message-State: APjAAAW1IQrlw1sQ2UumZMlH1kmOPjwVnutScFiBSRGI54IS2jtxUXSf
 lGmBvnEZeqPAvC67SQlhQ8R6pnyC8RTNsc3HEF9UbA==
X-Google-Smtp-Source: APXvYqxPQaHe0ajM9EaFYWOKeO1qx5rLjG9Ri2SplUUGh2oAO+P037hMuCCLkPI/S/kkV1vTWPuw83Yfi6xG3YezsC4=
X-Received: by 2002:a05:6830:2015:: with SMTP id
 e21mr19176597otp.106.1582123434662; 
 Wed, 19 Feb 2020 06:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-8-daniel.vetter@ffwll.ch>
 <20200219134211.GF5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219134211.GF5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 15:43:43 +0100
Message-ID: <CAKMK7uHCZ1cDRC1oeGp6crmPfdrx28Z9K4X3x-A26uSyZFrrhg@mail.gmail.com>
Subject: Re: [PATCH 07/52] drm/udl: Use drmm_add_final_kfree
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMjo0MiBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgRGFuaWVsLAo+Cj4gVGhh
bmsgeW91IGZvciB0aGUgcGF0Y2guCj4KPiBPbiBXZWQsIEZlYiAxOSwgMjAyMCBhdCAxMToyMDoz
N0FNICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gV2l0aCB0aGlzIHdlIGNhbiBkcm9w
IHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1bmN0aW9uLgo+ID4KPiA+IHYyOiBX
ZSBuZWVkIGRybV9kZXZfcHV0IHRvIHVucm9sbCB0aGUgZHJpdmVyIGNyZWF0aW9uIChvbmNlCj4g
PiBkcm1fZGV2X2luaXQgYW5kIGRybW1fYWRkX2ZpbmFsX2tmcmVlIHN1Y2VlZGVkKSwgb3RoZXJ3
aXNlCj4gPiB0aGUgZHJtbV8gbWFnaWMgZG9lc24ndCBoYXBwZW4uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4KPiBEaWQgeW91
IG1lYW4gdG8gc3F1YXNoIHRoaXMgd2l0aCB0aGUgcHJldmlvdXMgY29tbWl0ID8KClVoIHllcyBp
bmRlZWQuIFdpbGwgc3F1YXNoLgotRGFuaWVsCgo+Cj4gPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxp
ZWRAcmVkaGF0LmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiBFbWlsIFZl
bGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZA
dHJvbm5lcy5vcmc+Cj4gPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
Cj4gPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgfCAzICstLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwo+
ID4gaW5kZXggZDViODk3MTFhYjFlLi42YTU1OTQ5NDYwOTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfZHJ2LmMKPiA+IEBAIC04MSw4ICs4MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdWRsX2RldmljZSAq
dWRsX2RyaXZlcl9jcmVhdGUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSkKPiA+Cj4g
PiAgICAgICByID0gdWRsX2luaXQodWRsKTsKPiA+ICAgICAgIGlmIChyKSB7Cj4gPiAtICAgICAg
ICAgICAgIGRybV9kZXZfZmluaSgmdWRsLT5kcm0pOwo+ID4gLSAgICAgICAgICAgICBrZnJlZSh1
ZGwpOwo+ID4gKyAgICAgICAgICAgICBkcm1fZGV2X3B1dCgmdWRsLT5kcm0pOwo+ID4gICAgICAg
ICAgICAgICByZXR1cm4gRVJSX1BUUihyKTsKPiA+ICAgICAgIH0KPiA+Cj4KPiAtLQo+IFJlZ2Fy
ZHMsCj4KPiBMYXVyZW50IFBpbmNoYXJ0CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
