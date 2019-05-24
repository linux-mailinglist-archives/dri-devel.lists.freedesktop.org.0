Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1CE2966F
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0A86E0F8;
	Fri, 24 May 2019 10:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0020D6E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:54:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d9so9549289wrx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 03:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1ebscPgUpHJT060W/H3zX96t5OTIiRTnQJVhoOi+CcY=;
 b=dTM/sz543IxB4a77ydKpewrh5N0KoGOuY00kFk7STWc9z4V2MG9/dQfwgm+9GRhI0Q
 dG+uFFYywxGzZ00oSu1xU4LNhH6GNT+Gnic0EOXb6QiUO7ynXtfkL+647Iq8XFPuyH4n
 Or+yJJSyeawBy+UggTccqCtbQ97UPkYanpt0gTHSbHwHCrRo8fK86vU6NWB5hb4kra4z
 iXlSS03yG5JCmJ/OGeLK/eiq3meY7m1tdglZclKqOLPNJgbhKAi/qCYDb8ynbo0t0fEh
 YDrxXRozty4fsxBFN/gVdCmGMjd6Nz/8PeFmRwgFby+pIEerrIPKjRvjQ78IZIj4bMvb
 zwLQ==
X-Gm-Message-State: APjAAAXWpIfCkQGDuvqt3QNZ1YodxGaYYQRKs8J59dxjVicia9x7blJ/
 16E6RkRV5jougQGHnmqmEyzVV/fh
X-Google-Smtp-Source: APXvYqyACKzmOQQD7UFyDrnw6CpB09129iBbsGJDJXveOJCNiGPA1Q7aAjLfR8l6+xaYh27PJJtm1g==
X-Received: by 2002:adf:e686:: with SMTP id r6mr997684wrm.90.1558695274677;
 Fri, 24 May 2019 03:54:34 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id h188sm3781719wmf.48.2019.05.24.03.54.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 03:54:33 -0700 (PDT)
Date: Fri, 24 May 2019 11:53:13 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/5] drm/vmwgfx: use core drm to extend/check
 vmw_execbuf_ioctl
Message-ID: <20190524105313.GA6233@arch-x1c3>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-3-emil.l.velikov@gmail.com>
 <6c2d4e6c1554e59bfcf1b58fdc42c54bbe59b4c0.camel@vmware.com>
 <CAKMK7uH1=r=2pO-KbNUDw2dSmgATMUZchQo-8u1EoFb9d_YKHQ@mail.gmail.com>
 <2bb52a5a9d0ed61e79d6f93573fde98f9bec7365.camel@vmware.com>
 <CAKMK7uFeLV5eP3r6bjqaOYV-MTdHuA64CmCk6YXM3-_OfnaOPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFeLV5eP3r6bjqaOYV-MTdHuA64CmCk6YXM3-_OfnaOPg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1ebscPgUpHJT060W/H3zX96t5OTIiRTnQJVhoOi+CcY=;
 b=l9RqosOckjyJZX/2F0tjJv79ozKbZXFUm0dqMcecJty8MsE3uqVQOmBR93mID+ji1Y
 V14qhAHcBYXzagkdE+Z8aS/L0tBhT3fyqMgOw6Yt3l2izgntvu9DbULNzR1cX18Z33t3
 t54HSEybmaFWp/edlGB/PofNlT2eDEbpWSp/IKEJa8EoWgz5MWnU5lO/N7lVBRyAdCo+
 UR+/hGeF8kl4PpW+w1VPf+mWxg34AeW5Oi4YA75uaMVO03dBhxZKJdUKfbRykVAm/O5P
 Wlhh4xwcP/3GK8WpB4YIIwJR++BmH24ZuHNcaiKjEwupVep4hsDD51yVLpitJnTrrJOl
 eSMA==
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
 "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIE1heSAyNCwgMjAx
OSBhdCA4OjA1IEFNIFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gT24gV2VkLCAyMDE5LTA1LTIyIGF0IDIxOjA5ICswMjAwLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4gPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCA5OjAxIFBNIFRob21hcyBI
ZWxsc3Ryb20gPAo+ID4gPiB0aGVsbHN0cm9tQHZtd2FyZS5jb20+IHdyb3RlOgo+ID4gPiA+IEhp
LCBFbWlsLAo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCAyMDE5LTA1LTIyIGF0IDE3OjQxICswMTAw
LCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwu
dmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEN1cnJlbnRseSB2bXdf
ZXhlY2J1Zl9pb2N0bCgpIG9wZW4tY29kZXMgdGhlIHBlcm1pc3Npb24gY2hlY2tpbmcsCj4gPiA+
ID4gPiBzaXplCj4gPiA+ID4gPiBleHRlbmRpbmcgYW5kIGNvcHlpbmcgdGhhdCBpcyBhbHJlYWR5
IGRvbmUgaW4gY29yZSBkcm0uCj4gPiA+ID4gPgo+ID4gPiA+ID4gS2lsbCBhbGwgdGhlIGR1cGxp
Y2F0aW9uLCBhZGRpbmcgYSBmZXcgY29tbWVudHMgZm9yIGNsYXJpdHkuCj4gPiA+ID4KPiA+ID4g
PiBBaCwgdGhlcmUgaXMgY29yZSBmdW5jdGlvbmFsaXR5IGZvciB0aGlzIG5vdy4KPiA+ID4gPgo+
ID4gPiA+IFdoYXQgd29ycmllcyBtZSB0aG91Z2ggd2l0aCB0aGUgY29yZSBhcHByb2FjaCBpcyB0
aGF0IHRoZSBzaXplcyBhcmUKPiA+ID4gPiBub3QKPiA+ID4gPiBjYXBwZWQgYnkgdGhlIHNpemUg
b2YgdGhlIGtlcm5lbCBhcmd1bWVudCBkZWZpbml0aW9uLCB3aGljaCBtYWtlcwo+ID4gPiA+IG1h
aWxpY2lvdXMgdXNlci1zcGFjZSBiZWluZyBhYmxlIHRvIGZvcmNlIGttYWxsb2NzKCkgdGhlIHNp
emUgb2YKPiA+ID4gPiB0aGUKPiA+ID4gPiBtYXhpbXVtIGlvY3RsIHNpemUuIFNob3VsZCBwcm9i
YWJseSBiZSBmaXhlZCBiZWZvcmUgcHVzaGluZyB0aGlzLgo+ID4gPgo+ID4gPiBIbSBJIGFsd2F5
cyB3b3JrZWQgdW5kZXIgdGhlIGFzc3VtcHRpb24gdGhhdCBrbWFsbG9jIGFuZCBmcmllbmRzCj4g
PiA+IHNob3VsZCBiZSB1c2Vyc3BhY2UgaGFyZGVuZWQuIE90aGVyd2lzZSBzdHVmZiBsaWtlIGtt
YWxsb2NfYXJyYXkKPiA+ID4gZG9lc24ndCBtYWtlIGFueSBzZW5zZSwgZXZlcnlvbmUganVzdCBm
ZWVkcyBpdCB1bmNoZWNrZWQgaW5wdXQgYW5kCj4gPiA+IGV4cGVjdHMgdGhhdCBoZWxwZXIgdG8g
aGFuZGxlIG92ZXJmbG93cy4KPiA+ID4KPiA+ID4gSWYgd2UgYXNzdW1lIGttYWxsb2MgaXNuJ3Qg
aGFyZGVuZWQgYWdhaW5zdCB0aGF0LCB0aGVuIHdlIGhhdmUgYSBtdWNoCj4gPiA+IGJpZ2dlciBw
cm9ibGVtIHRoYW4ganVzdCB2bXdnZnggaW9jdGxzIC4uLgo+ID4KPiA+IEFmdGVyIGNoZWNraW5n
IHRoZSBkcm1faW9jdGwgY29kZSBJIHJlYWxpemUgdGhhdCB3aGF0IEkgdGhvdWdodCB3YXMgbmV3
Cj4gPiBiZWhhdmlvdXIgYWN0dWFsbHkgaGFzIGJlZW4gYXJvdW5kIGZvciBhIGNvdXBsZSBvZiB5
ZWFycywgc28KPiA+IGZpeGluZyBpc24ndCByZWFsbHkgdGllZCB0byB0aGlzIHBhdGNoIHNlcmll
cy4uLgo+ID4KPiA+IFdoYXQgY2F1c2VkIG1lIHRvIHJlYWN0IHdhcyB0aGF0IHByZXZpb3VzbHkg
d2UgdXNlZCB0byBoYXZlIHRoaXMKPiA+Cj4gPiBlNGZkYTlmMjY0ZTEgKCJkcm06IFBlcmZvcm0g
aW9jdGwgY29tbWFuZCB2YWxpZGF0aW9uIG9uIHRoZSBzdG9yZWQKPiA+IGtlcm5lbCB2YWx1ZXMi
KQo+ID4KPiA+IGFuZCB3ZSBzZWVtIHRvIGhhdmUgbG9zdCB0aGF0IG5vdywgaWYgbm90IGZvciB0
aGUgaW8gZmxhZ3MgdGhlbiBhdAo+ID4gbGVhc3QgZm9yIHRoZSBzaXplIHBhcnQuIEZvciB0aGUg
c2l6ZSBvZiB0aGUgaW9jdGwgYXJndW1lbnRzLCBJIHRoaW5rCj4gPiBpbiBnZW5lcmFsIGlmIHRo
ZSBrZXJuZWwgb25seSB0b3VjaGVzIGEgc3Vic2V0IG9mIHRoZSB1c2VyLXNwYWNlCj4gPiBzcGVj
aWZpZWQgc2l6ZSBJIHNlZSBubyByZWFzb24gd2h5IHdlIHNob3VsZCBtYWxsb2MgLyBjb3B5IG1v
cmUgdGhhbgo+ID4gdGhhdD8KPiAKPiBJIGd1ZXNzIHdlIGNvdWxkIG9wdGltaXplIHRoYXQsIGJ1
dCB3ZSdkIHByb2JhYmx5IHN0aWxsIG5lZWQgdG8gemVybwo+IGNsZWFyIHRoZSBhZGRlZCBzaXpl
IGZvciBmb3J3YXJkIGNvbXBhdCB3aXRoIG5ld2VyIHVzZXJzcGFjZS4gSWlyYwo+IHdlJ3ZlIGhh
ZCBzb21lIGlzc3VlcyBpbiB0aGlzIGFyZWEuCj4gCj4gPiBOb3csIGdpdmVuIHRoZSBmYWN0IHRo
YXQgdGhlIG1heGltdW0gaW9jdGwgYXJndW1lbnQgc2l6ZSBpcyBxdWl0ZQo+ID4gbGltaXRlZCwg
dGhhdCBtaWdodCBub3QgYmUgYSBiaWcgcHJvYmxlbSBvciBhIHByb2JsZW0gYXQgYWxsLiBPdGhl
cndpc2UKPiA+IGl0IHdvdWxkIGJlIHByZXR0eSBlYXN5IGZvciBhIG1hbGljaW91cyBwcm9jZXNz
IHRvIGFsbG9jYXRlIG1vc3Qgb3IgYWxsCj4gPiBvZiBhIHN5c3RlbSdzIHJlc2lkZW50IG1lbW9y
eT8KPiAKPiBUaGUgYmlnZ2VzdCB5b3UgY2FuIGFsbG9jYXRlIGZyb20ga21hbGxvYyBpcyBsaW1p
dGVkIGJ5IHRoZSBsYXJnZXN0Cj4gY29udGlndW91cyBjaHVuayBhbGxvY19wYWdlcyBnaXZlcyB5
b3UsIHdoaWNoIGlzIGxpbWl0ZWQgYnkgTUFYX09SREVSCj4gZnJvbSB0aGUgcGFnZSBidWRkeSBh
bGxvY2F0b3IuIFlvdSBuZWVkIGxvdHMgb2YgcHJvY2VzcyB0byBiZSBhYmxlIHRvCj4gZXhoYXVz
dCBtZW1vcnkgbGlrZSB0aGF0IChhbmQgbGlrZSBJIHNhaWQsIHRoZSBlbnRpcmUga2VybmVsIHdv
dWxkIGJlCj4gYnJva2VuIGlmIHdlJ2QgY29uc2lkZXIgdGhpcyBhIHNlY3VyaXR5IGlzc3VlKS4g
SWYgeW91IHdhbnQgdG8gbWFrZQo+IHN1cmUgdGhhdCBhIHByb2Nlc3MgZ3JvdXAgY2FuJ3QgZXho
YXVzdCBtZW1vcnkgdGhpcyB3YXkgdGhlbiB5b3UgbmVlZAo+IHRvIHNldCBhcHByb3ByaWF0ZSBj
Z3JvdXBzIGxpbWl0cy4KCkkgZG8gYWdyZWUgd2l0aCBhbGwgdGhlIHNlbnRpbWVudHMgdGhhdCBk
cm1faW9jdGwoKSBjb3VsZCB1c2Ugc29tZSBleHRyYQpvcHRpbWlzYXRpb24gYW5kIGhhcmRlbmlu
Zy4gQXQgdGhlIHNhbWUgdGltZSBJIHdvdWxkIHJlbWluZCB0aGF0IHRoZQpjb2RlIGhhcyBiZWVu
IHVzZWQgYXMtaXMgYnkgdm13Z2Z4IGFuZCBvdGhlciBkcml2ZXJzIGZvciB5ZWFycy4KCkluIG90
aGVyIHdvcmRzOiBsZXQncyBrZWVwIHRoYXQgd29yayBhcyBvcnRob2dvbmFsIHNlcmllcy4KCldo
YXQgZG8geW91IGd1eXMgdGhpbms/CkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
