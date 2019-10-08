Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0FCCF69E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47486E78C;
	Tue,  8 Oct 2019 09:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025DC6E78C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:59:08 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r16so15017177edq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 02:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=2l98lk49OlrmyCrycaeETbegcfULnfdtcZ91gkPMnqY=;
 b=rPOXwyD9+etFmTtCvcxlkHtINONh7xnRbxwkRLzSxCwn6o0hvFVQ01SWSUXztr+9tt
 F5gjUr9oDpPLfktjhF12Ycz4YvDNScMzt50MK0ySMz3kEQaC1Dg+xTZw4eDiKiPVelYf
 52w0kUKvk2Fmv3Z/aPuOrEgORhK/m+xgIO608NNV7XTNXuYd8n+0mbZUMXHOApM81Yj3
 RscPR6I4tMw1wfy253pPjtCg/iuSvofCZ2E/jvDb9pFVvJV/pzS4IX29jJbRDPMuGX6I
 KLvBO2uv7EAUWinBnQOtbgEM+kB+3y2OoHzlJJ0kxZ0wY0w113roMXRFFYXNj2pB7GRE
 7XLA==
X-Gm-Message-State: APjAAAVQ3Dqesm1j4OtLr5lpGEGmfuIV5Dhnke546aACC8nPGUxfDaLS
 I0F8GY3GNtrOZkY0CecaWLVwNA==
X-Google-Smtp-Source: APXvYqzkGrVlW3+RSavC1yt5aL0REs/3Yf6/Ur/HQNbKk4JiXKDoxnOGNByzGj2IMtV/98uDrRabrA==
X-Received: by 2002:a50:f152:: with SMTP id z18mr32377051edl.141.1570528747563; 
 Tue, 08 Oct 2019 02:59:07 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id nq1sm2235930ejb.75.2019.10.08.02.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 02:59:06 -0700 (PDT)
Date: Tue, 8 Oct 2019 11:59:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
Message-ID: <20191008095904.GL16989@phenom.ffwll.local>
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
 <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
 <20190930100707.178723d1@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930100707.178723d1@eldfell.localdomain>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2l98lk49OlrmyCrycaeETbegcfULnfdtcZ91gkPMnqY=;
 b=gYjCg9cjK6qfQguF4oi4eVIRnL3vWlBUnEiUuvAMSX7FpQQGl/Jy6ps8SncVIK9AWa
 Tfa+aV3aKT9JG94Qj5mFy5qq5gdocxFeKeMJwB9IB/OfGRHxO1Q902iHTTvA/sbD7FNe
 viCpKIAOM27iKGQcV9ZonbKBKpgjwgUeZlX54=
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
Cc: Simon Ser <contact@emersion.fr>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTA6MDc6MDdBTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gU3VuLCAyOSBTZXAgMjAxOSAyMDozMDo0NCArMDAwMAo+IFNpbW9uIFNlciA8
Y29udGFjdEBlbWVyc2lvbi5mcj4gd3JvdGU6Cj4gCj4gPiBIaSwKPiA+IAo+ID4gPiBPbiBNb24s
IFNlcCAyMywgMjAxOSBhdCAxMjozOToyMFBNICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6ICAKPiA+
ID4gPiBDdXJyZW50bHkgdGhlIHByb3BlcnR5IGRvY3MgZG9uJ3Qgc3BlY2lmeSB3aGV0aGVyIGl0
J3Mgb2theSBmb3IgdHdvIHBsYW5lcyB0bwo+ID4gPiA+IGhhdmUgdGhlIHNhbWUgenBvcyB2YWx1
ZSBhbmQgd2hhdCB1c2VyLXNwYWNlIHNob3VsZCBleHBlY3QgaW4gdGhpcyBjYXNlLgo+ID4gPiA+
Cj4gPiA+ID4gVGhlIHJ1bGUgbWVudGlvbm5lZCBpbiB0aGUgcGFzdCB3YXMgdG8gZGlzYW1iaWd1
YXRlIHdpdGggb2JqZWN0IElEcy4gSG93ZXZlcgo+ID4gPiA+IHNvbWUgZHJpdmVycyBicmVhayB0
aGlzIHJ1bGUgKHRoYXQncyB3aHkgdGhlIG9yZGVyaW5nIGlzIGRvY3VtZW50ZWQgYXMKPiA+ID4g
PiB1bnNwZWNpZmllZCBpbiBjYXNlIHRoZSB6cG9zIHByb3BlcnR5IGlzIG1pc3NpbmcpLiBBZGRp
dGlvbmFsbHkgaXQgZG9lc24ndAo+ID4gPiA+IHJlYWxseSBtYWtlIHNlbnNlIGZvciBhIGRyaXZl
ciB0byB1c2VyIGlkZW50aWNhbCB6cG9zIHZhbHVlcyBpZiBpdCBrbm93cyB0aGVpcgo+ID4gPiA+
IHJlbGF0aXZlIHBvc2l0aW9uOiB0aGUgZHJpdmVyIGNhbiBqdXN0IHBpY2sgZGlmZmVyZW50IHZh
bHVlcyBpbnN0ZWFkLgo+ID4gPiA+Cj4gPiA+ID4gU28gdHdvIHNvbHV0aW9ucyB3b3VsZCBtYWtl
IHNlbnNlOiBlaXRoZXIgZGlzYWxsb3cgY29tcGxldGVseSBpZGVudGljYWwgenBvcwo+ID4gPiA+
IHZhbHVlcyBmb3IgdHdvIGRpZmZlcmVudCBwbGFuZXMsIGVpdGhlciBtYWtlIHRoZSBvcmRlcmlu
ZyB1bnNwZWNpZmllZC4gVG8gYWxsb3cKPiA+ID4gPiBkcml2ZXJzIHRoYXQgZG9uJ3Qga25vdyB0
aGUgcmVsYXRpdmUgb3JkZXJpbmcgYmV0d2VlbiB0d28gcGxhbmVzIHRvIHN0aWxsCj4gPiA+ID4g
ZXhwb3NlIHRoZSB6cG9zIHByb3BlcnR5LCBjaG9vc2UgdGhlIGxhdHRlciBzb2x1dGlvbi4gIAo+
ID4gPgo+ID4gPiBTb21lIEFybSdzIHVzYWdlIGNhc2VzIGFib3V0IHR3byBwbGFuZXMgd2l0aCBz
YW1lIHpwb3MuCj4gPiA+Cj4gPiA+IC0gIlNtYXJ0IGxheWVyIgo+ID4gPiB3aGljaCBjYW4gYWNj
ZXB0cyA0IGRpZmZlcmVudCBmYnMgd2l0aCBkaWZmZXJlbnQgc3JjL2Rpc3BsYXkgcmVjdCwKPiA+
ID4gYnV0IHRoaXMgc21hcnQgbGF5ZXIgaGFzIG9uZSByZXN0cmljdGlvbjoKPiA+ID4KPiA+ID4g
NCBkaXNwbGF5IHJlY3RzIG11c3QgaGF2ZSBubyBvdmVybGFwcyBpbiBWIGRpcmVjdGlvbgo+ID4g
PiAoQSBvcHRpbWl6YXRpb24gZm9yIGFuZHJvaWQgd2luZG93IGxpa2UgVG9vbGJhci9OYXZpZ2F0
aW9uIGJhcikKPiA+ID4KPiA+ID4gU28gd2hlbiBtYXAgdGhpcyBTbWFydC1sYXllciB0byBkcm0g
d29ybGQsIGl0IG1pZ2h0IGJlIDQgZGlmZmVyZW50Cj4gPiA+IGRybS1wbGFuZXMsIGJ1dCB3aXRo
IHNhbWUgem9yZGVyIHRvIGluZGljYXRlIHRoYXQgdGhlc2UgNCBwbGFuZXMgYXJlCj4gPiA+IHNt
YXJ0LWxheWUgcGxhbmVzLgo+ID4gPgo+ID4gPiAtICJWUi1MYXllciIKPiA+ID4gT25lIFZSLWxh
eWVyIGNvbXByaXNlcyB0d28gZGlmZmVyZW50IHZpZXdwb3J0cyB3aGljaCBjYW4gYmUgY29uZmln
dXJlZAo+ID4gPiB3aXRoIHRvdG9hbGx5IGRpZmZlcmVudCBmYnMsIHNyYy9kaXNwbGF5IHJlY3Qu
Cj4gPiA+IHdlIHVzZSB0d28gZGlmZmVyZXJudCBkcm0tcGxhbmVzIHRvIGRyaXZlIG9uIEhXICJW
Ui1MYXllciIsIGFuZCB0aGVzZQo+ID4gPiB0d28gZHJtLXBsYW5lcyBtdXN0IGJlIGNvbmZpZ3Vy
ZWQgd2l0aCBzYW1lIHpwb3MuICAKPiA+IAo+ID4gVGhhbmtzIGEgbG90IGZvciB5b3VyIGZlZWRi
YWNrIEphbWVzLCB0aGF0J3MgZXhhY3RseSB3aGF0IEkgd2FzIGxvb2tpbmcgZm9yLgo+ID4gQm90
aCBvZiB0aGVzZSB1c2UtY2FzZXMgbWFrZSBzZW5zZSB0byBtZS4KPiA+IAo+ID4gSSB0aGluayB1
c2VyLXNwYWNlIHNob3VsZCBiZSBwcmVwYXJlZCB0byBoYW5kbGUgaWRlbnRpY2FsIGltbXV0YWJs
ZSB6cG9zIHZhbHVlcy4KPiA+IFBla2thIGFuZCBEYW5pZWwsIHRob3VnaHRzPwo+IAo+IEhpLAo+
IAo+IGdpdmVuIHRob3NlIGV4cGxhaW5lZCB1c2UgY2FzZXMsIHN1cmUsIEkgYWdyZWUuCj4gCj4g
PiBJbiBhbnkgY2FzZSwgdGhpcyBkb2Vzbid0IGNoYW5nZSB0aGUgcGF0Y2ggaXRzZWxmLiBQcm9i
YWJseSBzb21ldGhpbmcgd29ydGgKPiA+IG1lbnRpb25uaW5nIGluIHRoZSBjb21taXQgbWVzc2Fn
ZS4KPiAKPiBZZXMsIHJlY29yZGluZyB0aGVzZSB1c2UgY2FzZXMgd291bGQgYmUgdmVyeSBuaWNl
LgoKVGhlcmUncyBhIGxvdCBtb3JlIGh3IHRoYXQgZG9lcyB0aGUgc2FtZSB0cmlja3MgKHF1YWxj
b20gaXMgb25lIGZvciBzdXJlKS4KSW1vIGJlZm9yZSB3ZSBlbmNvZGUgdGhpcyB3ZSBzaG91bGQg
bWFrZSBzdXJlIHRoYXQ6CmEpIGV2ZXJ5b25lIGlzIGhhcHB5IHdpdGggdGhpcyBuZXcgdWFwaQpi
KSBkcml2ZXJzIGFyZSBjb25zaXN0ZW50CmMpIG1heWJlIGV2ZW4gdGVzdGNhc2VzIGluIGlndApk
KSBkZWZpbml0ZWx5IGFuIG9wZW4gc291cmNlIHVzZXIKZSkgbm8gYnJlYWtpbmcgb2YgZXhpc3Rp
bmcgdXNlcnNwYWNlCgpJLmUuIGRlZmluaXRlbHkgYSBzZXBhcmF0ZSBwYXRjaC4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
