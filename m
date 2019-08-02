Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173667FBB6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 16:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A03E6EE6A;
	Fri,  2 Aug 2019 14:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6336EE6A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 14:06:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k21so72514671edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 07:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=p1KbwWigVt4fPabp1PFOSuWAjFwg5XXZ5xw32khObXU=;
 b=TxrISgBr9xiPu6OPMotg6K1XLdcGnlLAA4oXCyhJgCTwtjpqQ7K51+5/RCMgnROmst
 nuAWFnh8jZrkRVxVOGmxtz1HH3vQkC9fgdE4B1EGLXbs2zp3QQBLa2XFac5Vj6gDTb+l
 K7P5iohnVZ5yNHOmEPaBiJYSFywNnxJrmPftnmSCrZinC8DwqtYeVMvjtk5QOP6rxkXM
 qr36go8eWtwy2wt51vuM22d00gpk+6CrL96VEJJ8/Sb3//ebtl+iKoWiWOXI5bukvbAZ
 q6zh2HiuUGhKOfOc3eQ3p/SX0AbI76nRL+53LNjtmDISKaeIcTqrcNwPzvdwsXDuGCvT
 rP+w==
X-Gm-Message-State: APjAAAX6lu0Xp1IomCMdeffFzoERSAT85fvhoptp0GTCO2FxCDAMrhxr
 mqQLHmFuv96vzzS366fBIxZeP/B9y9k=
X-Google-Smtp-Source: APXvYqxIKtpjCYsHchgchG2dJLleNo/WK0qX+MScSUhXnTDIghKPIHG/6otAtiBcYt4kc29kBRcuDA==
X-Received: by 2002:a17:906:1292:: with SMTP id
 k18mr106811258ejb.146.1564754779811; 
 Fri, 02 Aug 2019 07:06:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f24sm17778831edt.82.2019.08.02.07.06.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 07:06:18 -0700 (PDT)
Date: Fri, 2 Aug 2019 16:06:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Message-ID: <20190802140616.GM7444@phenom.ffwll.local>
Mail-Followup-To: Brian Starkey <Brian.Starkey@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "eric@anholt.net" <eric@anholt.net>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, 
 "sean@poorly.run" <sean@poorly.run>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
 <CAKMK7uH38rxyTyuYRGJ6NBejyUxQ6Qvr1CdjH2kpXiq+3-=t8Q@mail.gmail.com>
 <20190802100904.blnusnieti3pxgxu@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802100904.blnusnieti3pxgxu@DESKTOP-E1NTVVP.localdomain>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=p1KbwWigVt4fPabp1PFOSuWAjFwg5XXZ5xw32khObXU=;
 b=abum6jWtI06IzQi92RY7wBkZcRWpAJN9L98U26jHEw7mz51UiJ10czXj1+jLNnKXXH
 ddW1pa0TIOvUAnwJ4pxNyD8wvPRfV/l8Hg5EWt2f6s1yrLHeFV4JOlesmdS1ik/vkJjJ
 5DFXSoH6+dVof4FN7sJiaFAIl787oeGMwqdAg=
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMTA6MDk6MDVBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMTE6NDU6MTNB
TSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDIsIDIwMTkgYXQg
MTE6NDMgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gRnJpLCBBdWcgMiwgMjAxOSBhdCAxMToyOSBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5T
dGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgTG93cnksCj4gPiA+ID4K
PiA+ID4gPiBPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAwNjozNDowOEFNICswMDAwLCBMb3dyeSBM
aSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gSGkgQnJpYW4sCj4gPiA+
ID4gPgo+ID4gPiA+ID4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDk6MjA6MDRQTSArMDgwMCwg
QnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gPiA+ID4gSGkgTG93cnksCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFRoYW5rcyBmb3IgdGhpcyBjbGVhbnVwLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTowNDo0NUFNICswMDAwLCBMb3dyeSBMaSAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gPiA+IER1cmluZyBpdCBzaWduYWxz
IHRoZSBjb21wbGV0aW9uIG9mIGEgd3JpdGViYWNrIGpvYiwgYWZ0ZXIgcmVsZWFzaW5nCj4gPiA+
ID4gPiA+ID4gdGhlIG91dF9mZW5jZSwgd2UnZCBjbGVhciB0aGUgcG9pbnRlci4KPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IENoZWNrIGlmIGZlbmNlIGxlZnQgb3ZlciBpbiBkcm1fd3JpdGVi
YWNrX2NsZWFudXBfam9iKCksIHJlbGVhc2UgaXQuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5s
aUBhcm0uY29tPgo+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX3dyaXRlYmFjay5jIHwgMjMgKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ID4gPiA+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV93cml0ZWJhY2suYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiA+ID4gPiA+
ID4gPiBpbmRleCBmZjEzOGI2Li40M2Q5ZTNiIDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gPiA+ID4gPiA+ID4gQEAgLTMyNCw2ICszMjQsOSBA
QCB2b2lkIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJhY2tfam9i
ICpqb2IpCj4gPiA+ID4gPiA+ID4gICBpZiAoam9iLT5mYikKPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgZHJtX2ZyYW1lYnVmZmVyX3B1dChqb2ItPmZiKTsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ICsgaWYgKGpvYi0+b3V0X2ZlbmNlKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJJ20gdGhp
bmtpbmcgaXQgbWlnaHQgYmUgYSBnb29kIGlkZWEgdG8gc2lnbmFsIHRoZSBmZW5jZSB3aXRoIGFu
IGVycm9yCj4gPiA+ID4gPiA+IGhlcmUsIGlmIGl0J3Mgbm90IGFscmVhZHkgc2lnbmFsZWQuIE90
aGVyd2lzZSwgaWYgdGhlcmUncyBzb21lb25lCj4gPiA+ID4gPiA+IHdhaXRpbmcgKHdoaWNoIHRo
ZXJlIHNob3VsZG4ndCBiZSksIHRoZXkncmUgZ29pbmcgdG8gYmUgd2FpdGluZyBhIHZlcnkKPiA+
ID4gPiA+ID4gbG9uZyB0aW1lIDotKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGFua3MsCj4g
PiA+ID4gPiA+IC1Ccmlhbgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gSGVyZSBpdCBoYXBwZW5lZCBh
dCBhdG9taWNfY2hlY2sgZmFpbGVkIGFuZCB0ZXN0IG9ubHkgY29tbWl0LiBGb3IgYm90aAo+ID4g
PiA+ID4gY2FzZXMsIHRoZSBjb21taXQgaGFzIGJlZW4gZHJvcHBlZCBhbmQgaXQncyBvbmx5IGEg
Y2xlYW4gdXAuIFNvIGhlcmUgYmV0dGVyCj4gPiA+ID4gPiBub3QgYmUgdHJlYXRlZCBhcyBhbiBl
cnJvciBjYXNlOikKPiA+ID4gPgo+ID4gPiA+IElmIGFueW9uZSBlbHNlIGhhcyBhIHJlZmVyZW5j
ZSBvbiB0aGUgZmVuY2UsIHRoZW4gSU1PIGl0IGFic29sdXRlbHkgaXMKPiA+ID4gPiBhbiBlcnJv
ciB0byByZWFjaCB0aGlzIHBvaW50IHdpdGhvdXQgdGhlIGZlbmNlIGJlaW5nIHNpZ25hbGVkIC0K
PiA+ID4gPiBiZWNhdXNlIGl0IG1lYW5zIHRoYXQgdGhlIGZlbmNlIHdpbGwgbmV2ZXIgYmUgc2ln
bmFsZWQuCj4gPiA+ID4KPiA+ID4gPiBJIGRvbid0IHRoaW5rIHRoZSBBUEkgZ2l2ZXMgeW91IGEg
d2F5IHRvIGNoZWNrIGlmIHRoaXMgaXMgdGhlIGxhc3QKPiA+ID4gPiByZWZlcmVuY2UsIHNvIGl0
J3Mgc2FmZXN0IHRvIGp1c3QgbWFrZSBzdXJlIHRoZSBmZW5jZSBpcyBzaWduYWxsZWQKPiA+ID4g
PiBiZWZvcmUgZHJvcHBpbmcgdGhlIHJlZmVyZW5jZS4KPiA+ID4gPgo+ID4gPiA+IEl0IGp1c3Qg
ZmVlbHMgd3JvbmcgdG8gbWUgdG8gaGF2ZSB0aGUgcG9zc2liaWxpdHkgb2YgYSBkYW5nbGluZyBm
ZW5jZQo+ID4gPiA+IHdoaWNoIGlzIG5ldmVyIGdvaW5nIHRvIGdldCBzaWduYWxsZWQ7IGFuZCBp
dCdzIGFuIGVhc3kgZGVmZW5zaXZlIHN0ZXAKPiA+ID4gPiB0byBtYWtlIHN1cmUgaXQgY2FuIG5l
dmVyIGhhcHBlbi4KPiA+ID4gPgo+ID4gPiA+IEkga25vdyBpdCBfc2hvdWxkbid0XyBoYXBwZW4s
IGJ1dCB3ZSBvZnRlbiBwdXQgaW4gaGFuZGxpbmcgZm9yIGNhc2VzCj4gPiA+ID4gd2hpY2ggc2hv
dWxkbid0IGhhcHBlbiwgYmVjYXVzZSB0aGV5IGZyZXF1ZW50bHkgZG8gaGFwcGVuIDotKQo+ID4g
Pgo+ID4gPiBXZSdyZSBub3QgYXMgcGFyYW5vaWQgd2l0aCB0aGUgdmJsYW5rIGZlbmNlcyBlaXRo
ZXIsIHNvIG5vdCBzdXJlIHdoeQo+ID4gPiB3ZSBuZWVkIHRvIGJlIHRoaXMgcGFyYW5vaWQgd2l0
aCB3cml0ZWJhY2sgZmVuY2VzLiBJZiB5b3VyIGRyaXZlcgo+ID4gPiBncmFicyBhbnl0aGluZyBm
cm9tIHRoZSBhdG9taWMgc3RhdGUgaW4gLT5hdG9taWNfY2hlY2sgaXQncyBidWdneQo+ID4gPiBh
bnl3YXkuCj4gPiA+Cj4gPiA+IElmIHlvdSB3YW50IHRvIGZpeCB0aGlzIHByb3Blcmx5IEkgdGhp
bmsgd2UgbmVlZCB0byBtb3ZlIHRoZSBjYWxsIHRvCj4gPiA+IHByZXBhcmVfc2lnbmFsbGluZygp
IGluIGJldHdlZW4gYXRvbWljX2NoZWNrIGFuZCBhdG9taWNfY29tbWl0LiBUaGVuIEkKPiA+ID4g
dGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gYWxzbyBmb3JjZS1jb21wbGV0ZSB0aGUgZmVuY2Ugb24g
ZXJyb3IgLi4uCj4gCj4gV2VsbCwgZmFpciBlbm91Z2guIEknbSBzdHJ1Z2dsaW5nIHdpdGggInRo
YXQncyB0b28gcGFyYW5vaWQiIHZzICJmaXgKPiBpdCBwcm9wZXJseSIgdGhvdWdoPyBJcyBpdCBh
ICJwcm9ibGVtIiB3b3J0aCBmaXhpbmcgb3Igbm90PwoKVXAgdG8geW91IHRvIGRlY2lkZSB0aGF0
LgoKPiBJdCBzZWVtcyBuYXR1cmFsIHRvIG1lIHRvIGRvIHRoZSBmZW5jZSBjbGVhbnVwIGluIHRo
ZSBjbGVhbnVwIGZ1bmN0aW9uCj4gZm9yIHRoZSBvYmplY3Qgd2hpY2ggb3ducyB0aGUgZmVuY2Uu
Cj4gCj4gPiA+Cj4gPiA+ID4gPiBTaW5jZSBmb3IgdXNlcnNwYWNlLCBpdCBzaG91bGQgaGF2ZSBi
ZWVuIGZhaWxlZCBvciBhIHRlc3Qgb25seSBjYXNlLCBzbwo+ID4gPiA+ID4gd3JpdGViYWNlIGZl
bmNlIHNob3VsZCBub3QgYmUgc2lnbmFsZWQuCj4gPiA+ID4KPiA+ID4gPiBJdCdzIG5vdCBvbmx5
IHVzZXJzcGFjZSB0aGF0IGNhbiB3YWl0IG9uIGZlbmNlcyAoYW5kIGluIGZhY3QgdGhpcwo+ID4g
PiA+IGZlbmNlIHdpbGwgbmV2ZXIgZXZlbiByZWFjaCB1c2Vyc3BhY2UgaWYgdGhlIGNvbW1pdCBm
YWlscyksIHRoZSBkcml2ZXIKPiA+ID4gPiBtYXkgaGF2ZSB0YWtlbiBhIGNvcHkgdG8gdXNlIGZv
ciAic29tZXRoaW5nIi4KPiA+IAo+ID4gSSBmb3Jnb3QgdG8gYWRkOiB5b3UgY2FuIGNoZWNrIHRo
aXMgYnkgbG9va2luZyBhdCB0aGUgZmVuY2UgcmVmZXJlbmNlCj4gPiBjb3VudC4gQSBXQVJOX09O
IGlmIHRoYXQncyBtb3JlIHRoYW4gMSBvbiBjbGVhbnVwIChidXQgYWxzbyBmb3IgdGhlCj4gPiBv
dXQgZmVuY2VzKSBjb3VsZCBiZSBhIG5pY2UgYWRkaXRpb24uCj4gCj4gRG8gd2UgcmVhbGx5IHdh
bnQgdG8gYmUgbG9va2luZyBhdCB0aGUgZmVuY2UgaW50ZXJuYWxzIGRpcmVjdGx5IGxpa2UKPiB0
aGF0PwoKV3JhcCBpdCB1cCBpbiBhIGhlbHBlciBsaWtlIGRtYV9mZW5jZV9yZWxlYXNlX3ByaXZh
dGUgb3Igd2hhdGV2ZXIsIHdoaWNoCmNvbWJpbmVzIHRoZSBjaGVjayBhbmQgKGhvcGVmdWxseSBm
aW5hbCkgX3B1dCgpLiBNaWdodCBuZWVkIGEgYmV0dGVyIG5hbWUuCi1EYW5pZWwKCj4gCj4gQ2hl
ZXJzLAo+IC1Ccmlhbgo+IAo+ID4gLURhbmllbAo+ID4gLS0gCj4gPiBEYW5pZWwgVmV0dGVyCj4g
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+ICs0MSAoMCkgNzkgMzY1
IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
