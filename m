Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997A4A2E8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD836E185;
	Tue, 18 Jun 2019 13:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFBF6E185
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:57:27 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so21891727edq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=o/y3CZ/9JeNO2iCsdOOt0XY4J6Mjvbtp9LFupuckhZ4=;
 b=TOsKpQpdm6wiO6sfrfyT3lvbm2fwkOJPixcLRBM3DzaqcD4ucUn4v2VrgX0XmjN0wU
 iUhy2rccA3eheg4KoLucy2prWRZ/8kUGyoLCAG7PdQxlnXkILpHAufwcwn/Bng2YfQc8
 T7VvL6IMW9D8rCZ9mTF+P42dyH85a71qrDpHc3JkFZ5iYLjdGjNxulmoNIIsaLIVWCEa
 /IgHenMnCg+7kjo23Wd+DVR0Tx58HD3SzwRrlgJoJ8diP0Y+fGR10dkprnVJVCiOkLnh
 gVitk6wukcUnakkSq8yqeABzVeE+1Qo0DHn9DXh3WDapYfrIhQuFgx5/A4P3ZihOS7Fp
 GfnQ==
X-Gm-Message-State: APjAAAWjYghYiN8ZP0NAo8qhAg/EemUigf1tpULOqSYJz55++dgnLzgW
 +lU/OybHBIRNL2MhVgfoFrILLA==
X-Google-Smtp-Source: APXvYqwtJ81ko/j4uiBwlzOpNyHL5Pdn8++Gh9/D0d6Oq/qtmt+5KEY1nwEbI0h67zViB4yBbxE2zQ==
X-Received: by 2002:a17:906:1813:: with SMTP id
 v19mr86316985eje.109.1560866245783; 
 Tue, 18 Jun 2019 06:57:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id k51sm4833240edb.7.2019.06.18.06.57.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 06:57:24 -0700 (PDT)
Date: Tue, 18 Jun 2019 15:57:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <20190618135722.GY12905@phenom.ffwll.local>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
 <20190618132651.GC21105@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618132651.GC21105@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o/y3CZ/9JeNO2iCsdOOt0XY4J6Mjvbtp9LFupuckhZ4=;
 b=P96GNkQCn7GBJ+kRdR5lB0O45vwUeN4ZT0q+taflYGX56ag8mf+dK17GYNUmzm+nyy
 5f5dLCHZNc+qwZERUNQS9wsUzcb1SzVipnrEX8zgnzEjgXMTBf6IZVN3GoX1NCXQmTuX
 gwsfOSPtNKEiAV9lGkUn/wfTaBmtfPoXxIG8I=
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDQ6MjY6NTFQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6MjE6
NTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5
IGF0IDM6MTMgUE0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlk
ZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgcmVjb21tZW5kZWQgd2F5IHRv
IHNwZWNpZnkgR0VNIG9iamVjdCBmdW5jdGlvbnMgaXMgdG8gcHJvdmlkZSBhCj4gPiA+IGRybV9n
ZW1fb2JqZWN0X2Z1bmNzIHN0cnVjdHVyZSBpbnN0YW5jZSBhbmQgc2V0IHRoZSBHRU0gb2JqZWN0
IHRvIHBvaW50Cj4gPiA+IHRvIGl0LiBUaGUgZHJtX2NtYV9nZW1fY3JlYXRlX29iamVjdF9kZWZh
dWx0X2Z1bmNzKCkgZnVuY3Rpb24gcHJvdmlkZWQKPiA+ID4gYnkgdGhlIEdFTSBDTUEgaGVscGVy
IGRvZXMgc28gd2hlbiBjcmVhdGluZyB0aGUgR0VNIG9iamVjdCwgc2ltcGxpZnlpbmcKPiA+ID4g
dGhlIGRyaXZlciBpbXBsZW1lbnRhdGlvbi4gU3dpdGNoIHRvIGl0LCBhbmQgcmVtb3ZlIHRoZSB0
aGVuIHVubmVlZGVkCj4gPiA+IEdFTS1yZWxhdGVkIG9wZXJ0aW9ucyBmcm9tIHJjYXJfZHVfZHJp
dmVyLgo+ID4gPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgfCA4ICstLS0tLS0tCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+
IERhbmllbCwgaXMgdGhpcyB3aGF0IHlvdSBoYWQgaW4gbWluZCA/Cj4gPiAKPiA+IFl1cCwgSSB0
aGluayB0aGF0J3MgaXQuIE5vcmFsZiBjb21tZW50ZWQgdGhhdCB3ZSBtaWdodCB3YW50IHRvIGhh
dmUKPiA+IERSTV9HRU1fQ01BX0RSSVZFUl9PUFMgbWFjcm8gZm9yIHRoZSByZW1haW5pbmcgZmV3
IGRybV9kcml2ZXIgaG9va3MsIGxpa2UKPiA+IERSTV9HRU1fQ01BX1ZNQVBfRFJJVkVSX09QUyBi
dXQgd2l0aG91dCB0aGUgZm9yY2VkIHZtYXAgb24gaW1wb3J0LiBCdXQKPiA+IHRoYXQncyBvayB0
byBkbyBpbiBzb21lIGZvbGxvdy11cCBjbGVhbnVwIHRvby4gT24gdGhpczoKPiAKPiBOb3RlIHRo
YXQgdGhlIHJjYXItZHUgZHJpdmVyIHJlcXVpcmVzIGEgY3VzdG9tIC5kdW1iX2NyZWF0ZSgpIG9w
ZXJhdGlvbiwKPiB3aGljaCBpcyBhbm90aGVyIHJlYXNvbiB3aHkgSSBjYW4ndCB1c2UgRFJNX0dF
TV9DTUFfVk1BUF9EUklWRVJfT1BTLgoKSG0gSSB3YXMgYmxpbmQuIE5vdCBzdXJlIHlvdSBzdGls
bCB3YW50IG15IHItYiA6LSkgQnV0IHllYWggZ29vZCByZWFzb24Kbm90IHRvIHVzZSBhbiBvcHMg
bWFjcm8gZm9yIHRoaXMuCi1EYW5pZWwKCj4gCj4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfZHJ2LmMKPiA+ID4gaW5kZXggM2U1ZTgzNWVhMmI2Li40Y2JiODIwMDk5MzEgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwo+ID4gPiBAQCAt
NDQ1LDE2ICs0NDUsMTAgQEAgREVGSU5FX0RSTV9HRU1fQ01BX0ZPUFMocmNhcl9kdV9mb3BzKTsK
PiA+ID4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciByY2FyX2R1X2RyaXZlciA9IHsKPiA+ID4g
ICAgICAgICAuZHJpdmVyX2ZlYXR1cmVzICAgICAgICA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9E
RVNFVCB8IERSSVZFUl9QUklNRQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgRFJJVkVSX0FUT01JQywKPiA+ID4gLSAgICAgICAuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2Vk
ID0gZHJtX2dlbV9jbWFfZnJlZV9vYmplY3QsCj4gPiA+IC0gICAgICAgLmdlbV92bV9vcHMgICAg
ICAgICAgICAgPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAo+ID4gPiArICAgICAgIC5nZW1fY3JlYXRl
X29iamVjdCAgICAgID0gZHJtX2NtYV9nZW1fY3JlYXRlX29iamVjdF9kZWZhdWx0X2Z1bmNzLAo+
ID4gPiAgICAgICAgIC5wcmltZV9oYW5kbGVfdG9fZmQgICAgID0gZHJtX2dlbV9wcmltZV9oYW5k
bGVfdG9fZmQsCj4gPiA+ICAgICAgICAgLnByaW1lX2ZkX3RvX2hhbmRsZSAgICAgPSBkcm1fZ2Vt
X3ByaW1lX2ZkX3RvX2hhbmRsZSwKPiA+ID4gLSAgICAgICAuZ2VtX3ByaW1lX2ltcG9ydCAgICAg
ICA9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAo+ID4gPiAtICAgICAgIC5nZW1fcHJpbWVfZXhwb3J0
ICAgICAgID0gZHJtX2dlbV9wcmltZV9leHBvcnQsCj4gPiA+IC0gICAgICAgLmdlbV9wcmltZV9n
ZXRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCj4gPiA+ICAgICAg
ICAgLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRf
c2dfdGFibGUsCj4gPiA+IC0gICAgICAgLmdlbV9wcmltZV92bWFwICAgICAgICAgPSBkcm1fZ2Vt
X2NtYV9wcmltZV92bWFwLAo+ID4gPiAtICAgICAgIC5nZW1fcHJpbWVfdnVubWFwICAgICAgID0g
ZHJtX2dlbV9jbWFfcHJpbWVfdnVubWFwLAo+ID4gPiAgICAgICAgIC5nZW1fcHJpbWVfbW1hcCAg
ICAgICAgID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwKPiA+ID4gICAgICAgICAuZHVtYl9jcmVh
dGUgICAgICAgICAgICA9IHJjYXJfZHVfZHVtYl9jcmVhdGUsCj4gPiA+ICAgICAgICAgLmZvcHMg
ICAgICAgICAgICAgICAgICAgPSAmcmNhcl9kdV9mb3BzLAo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4g
Cj4gTGF1cmVudCBQaW5jaGFydAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
