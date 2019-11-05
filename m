Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA1FF01B7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 16:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B106EAC3;
	Tue,  5 Nov 2019 15:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C25B6EAC2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 15:41:53 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c19so1882639otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 07:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYpV5+o1A/dXvbQaQ7n7dcL2+JD79qjMx+pIX36zQXU=;
 b=Dw94xmzqYpH8KFB/BdJyCeXgmi43rl1lw7YPpKIIs5yOLkTNuvkcvKZiDlGd7T+j5V
 7bdKQhQMZ+qiBuq432+RuXbuKuaZRJ5EWxW/cwxtfRbArqSmaabAcQ3duqBzSmtMuBEa
 xiyBJuR/Woyj01fLl0wqdRLyCg+cFJIFvDJeFNAbxyfu1bTw/Sl3oJKW3m+i2L/EdMMH
 Wm3R82odV57rQXbAEbPNSUH3jlKWsTqOpHde4VAcbqYuWMBonikolVq/boWL01bvKHN/
 ZkVDnHCj9Qv/VcS7ArY9xSvPuSq+NOeqSb7l9hBRCUicc1ixdHFBs96wqoNf6vqTsu7K
 4Sdg==
X-Gm-Message-State: APjAAAWNSfajyTZOkkAM7RfSMAQ1BKe/4VUJ4ioFqDp5OLtBiX6kqSBP
 KEfGJK8jS7fCKe3+DdYIY7HFq62NjS6Nydz5eAwfKw==
X-Google-Smtp-Source: APXvYqwsv1as2ejBQgt0yF61DLtdufwSuN9OWBbVoSv6U2YVvVTmDaT6G27AR5seiL/WGxW7SuFgVJ7Uw4VuuLDjWUY=
X-Received: by 2002:a05:6830:1649:: with SMTP id
 h9mr1965788otr.281.1572968512490; 
 Tue, 05 Nov 2019 07:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20191014184320.GA161094@dtor-ws> <20191105004050.GU57214@dtor-ws>
 <CACRpkdak-gW9+OV-SZQVNNi5BuyNzkjkKvHmYp2+eYq4vu2nyg@mail.gmail.com>
In-Reply-To: <CACRpkdak-gW9+OV-SZQVNNi5BuyNzkjkKvHmYp2+eYq4vu2nyg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 5 Nov 2019 16:41:41 +0100
Message-ID: <CAKMK7uG7FQ3bDWsTxq0n8Osh7jjws5ia3PFJXvDdo=nxKu7+Ng@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cYpV5+o1A/dXvbQaQ7n7dcL2+JD79qjMx+pIX36zQXU=;
 b=Si47Mpriw1EKXcSZsKuCqlPm4/dogrxQwhOJv0m772xFHmIUe052ovmhrkWgGU+Bkl
 jZ5bwHGw4D+uiMu+tsUEztuFOU+SRx0OYmKjn34Oa0IqeWEfvy9uB3oFmhEp4Bk6BxU9
 q1whDXxaitjDU2vXBm44oZTDU/eQILq9K0+wk=
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCA0OjI5IFBNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiA1LCAyMDE5IGF0IDE6NDAgQU0g
RG1pdHJ5IFRvcm9raG92Cj4gPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTE6NDM6MjBBTSAtMDcwMCwgRG1pdHJ5IFRvcm9raG92
IHdyb3RlOgo+Cj4gPiA+IEluc3RlYWQgb2YgZndub2RlX2dldF9uYW1lZF9ncGlvZCgpIHRoYXQg
SSBwbGFuIHRvIGhpZGUgYXdheSwgbGV0J3MgdXNlCj4gPiA+IHRoZSBuZXcgZndub2RlX2dwaW9k
X2dldF9pbmRleCgpIHRoYXQgbWltaWNzIGdwaW9kX2dldF9pbmRleCgpLCBidXQKPiA+ID4gd29y
a3Mgd2l0aCBhcmJpdHJhcnkgZmlybXdhcmUgbm9kZS4KPiA+ID4KPiA+ID4gUmV2aWV3ZWQtYnk6
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21haWwu
Y29tPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gQW5kcnplaiwgTmVpbCwKPiA+ID4KPiA+ID4gVGhp
cyBkZXBlbmRzIG9uIHRoZSBuZXcgY29kZSB0aGF0IGNhbiBiZSBib3VuZCBpbgo+ID4gPiBpYi1m
d25vZGUtZ3Bpb2QtZ2V0LWluZGV4IGltbXV0YWJsZSBicmFuY2ggb2YgTGludXMnIFdhbGxlaWog
dHJlZToKPiA+ID4KPiA+ID4gICAgICAgICBnaXQgcHVsbCBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LWdwaW8uZ2l0IGliLWZ3bm9kZS1n
cGlvZC1nZXQtaW5kZXgKPiA+ID4KPiA+ID4gSSBob3BlIHRoYXQgaXQgd291bGQgYmUgcG9zc2li
bGUgdG8gcHVsbCBpbiB0aGlzIGltbXV0YWJsZSBicmFuY2ggYW5kCj4gPiA+IG5vdCB3YWl0IHVu
dGlsIGFmdGVyIDUuNSBtZXJnZSB3aW5kb3csIG9yLCBhbHRlcm5hdGl2ZWx5LCBtZXJnZSB0aHJv
dWdoCj4gPiA+IExpbnVzIFdhbGxlaWoncyB0cmVlLgo+ID4KPiA+IEFueSBjaGFuY2UgdGhpcyBj
b3VsZCBiZSBtZXJnZWQsIHBsZWFzZT8KPgo+IEknbSBoYXBweSB0byBtZXJnZSBpdCBpbnRvIHRo
ZSBHUElPIHRyZWUgaWYgc29tZSBEUk0gbWFpbnRhaW5lciBjYW4KPiBwcm92aWRlIGFuIEFDSy4K
CkFjay4KCj4gR2V0dGluZyBBQ0sgZnJvbSBEUk0gcGVvcGxlIGlzIHByb2JsZW1hdGljIGFuZCBh
IGJpdCBvZiBmcmljdGlvbiBpbiB0aGUKPiBjb21tdW5pdHksIERWZXR0ZXIgdXN1YWxseSBhZHZp
Y2UgdG8gc2VlayBtdXR1YWwgcmV2aWV3cyBldGMsIGJ1dCBJTU8KPiBpdCB3b3VsZCBiZSBiZXR0
ZXIgaWYgc29tZSBwZW9wbGUgZmVsdCBtb3JlIGNvbXBlbGxlZCB0byByZXZpZXcgc3R1ZmYKPiBl
dmVudHVhbGx5LiAoQW5kIHRoYXQgaGFzIHRoZSBwcm9ibGVtIHRoYXQgaXQgZG9lc24ndCBzY2Fs
ZS4pCgpUaGlzIGhhcyBhIHJldmlldyBhbHJlYWR5IHBsdXMgaWYgeW91IG1lcmdlIHlvdXIgaW1w
bGllZCByZXZpZXcuClRoYXQncyBtb3JlIHRoYW4gZ29vZCBlbm91Z2ggaW1vLCBzbyBub3Qgc2Vl
aW5nIHRoZSBpc3N1ZSBoZXJlPwotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
