Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5E106886
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3636F4F6;
	Fri, 22 Nov 2019 09:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222D889471
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 18:31:29 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id n16so4138867oig.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zes9nx3wWOfwgkI+Dul1p5z28VLkMHp34WWYw/4B4xM=;
 b=cZnKpROVoTVSGE0IPGEF/XvsKi02FAwhwo2USBTA5Hv9h4gEWY1IE5OcR3cLJA6hI1
 qstRPheka/CK/gI1EsImAGkh2WViiT3/DU11bHRP0oYa23vBqkWxXppVeZC6Joic835w
 wXzIwVb6/Z2ff/8wSNy+/lQU4WB3tfMkD8ydPf+WS2b1FhfO4ABZ9Sz2aCwP92UVnzT1
 Nj30GUQ1YNdDUPJgJ/RKzB7fwgQFX59rrNqCXMHXXjZujDgkHMJ5kfAQVVo0Imkg3l1e
 SaWAUKZ6sn7jai2YoTUK4RZ0/FjH/WTljAVSQlLuXEW0lvqMS1kcvgh9enH57B/kgxuw
 fifQ==
X-Gm-Message-State: APjAAAWenI/yY3r8dUCViKpBfu0Ro7WcF9PNbw8easXGlPLGZpbBwhHC
 pUy8AAVfD+X3/vtQY309v5XhBeUEG6rqxy3xPjM=
X-Google-Smtp-Source: APXvYqyen3cn+EY2RAzHvEa5NUjEhWs2OO/9/OSlmmI0VmHx00JqrZodxXdJRT5Kl/NB0JdTu71ixm3Ce1mmHgz5IXQ=
X-Received: by 2002:aca:c50f:: with SMTP id v15mr9263185oif.5.1574361088233;
 Thu, 21 Nov 2019 10:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004190938.15353-1-navid.emamdoost@gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Thu, 21 Nov 2019 12:31:17 -0600
Message-ID: <CAEkB2EQGCcwBO4iZBiHthUAJUeprw2Q09932GATd6XVyXqukzw@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: fix memory leak in imx_pd_bind
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zes9nx3wWOfwgkI+Dul1p5z28VLkMHp34WWYw/4B4xM=;
 b=Wkp25PFcZ403A1Ab9dtH00UDW+ztY9yfO5ob/GgE/2yV3cRKXm7YMtYFtLdE+Dsva3
 9Rp7LdEU0QVZIsPXy980hXnC4LQ9KYwFcnhhwyD0vo4Ok6W3S6MZRT5jISG4FvLREXtz
 AWAp8TsSWkWK8zlCxWzKcEZ/j6zwmvwRFNOG78fD68Z8CxTbK06XUuEF+1q0XUT1Ovhs
 C0xgW4AGzSMcuLFkJ64mQbF2vtg/0a2TRJhlwNHdWkkfTCAr3cgi3cBxR9GKcC1Gkppu
 YTEvvuuBpO9jyZpYHtYh0xn7CGIvTzBvTNIjpSvir4A692IKFEazzfbK47bCNvU0KlKx
 qS1g==
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Navid Emamdoost <emamd001@umn.edu>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAyOjA5IFBNIE5hdmlkIEVtYW1kb29zdAo8bmF2aWQuZW1h
bWRvb3N0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJbiBpbXhfcGRfYmluZCwgdGhlIGR1cGxpY2F0
ZWQgbWVtb3J5IGZvciBpbXhwZC0+ZWRpZCB2aWEga21lbWR1cCBzaG91bGQKPiBiZSByZWxlYXNl
ZCBpbiBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2Ugb3IgaW14X3BkX3JlZ2lzdGVyIGZhaWwu
Cj4KPiBGaXhlczogZWJjOTQ0NjEzNTY3ICgiZHJtOiBjb252ZXJ0IGRyaXZlcnMgdG8gdXNlIGRy
bV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSIpCj4gRml4ZXM6IDE5MDIyYWFhZTY3NyAoInN0YWdp
bmc6IGRybS9pbXg6IEFkZCBwYXJhbGxlbCBkaXNwbGF5IHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYt
Ynk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KPiAtLS0KCldv
dWxkIHlvdSBwbGVhc2UgcmV2aWV3IHRoaXMgcGF0Y2g/CgpUaGFua3MsCgo+ICBkcml2ZXJzL2dw
dS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgv
cGFyYWxsZWwtZGlzcGxheS5jCj4gaW5kZXggZTdjZTE3NTAzYWUxLi45NTIyZDJjYjBhZDUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwo+IEBAIC0yMjcsMTQgKzIy
NywxOCBAQCBzdGF0aWMgaW50IGlteF9wZF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+Cj4gICAgICAgICAvKiBwb3J0QDEgaXMgdGhl
IG91dHB1dCBwb3J0ICovCj4gICAgICAgICByZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlk
Z2UobnAsIDEsIDAsICZpbXhwZC0+cGFuZWwsICZpbXhwZC0+YnJpZGdlKTsKPiAtICAgICAgIGlm
IChyZXQgJiYgcmV0ICE9IC1FTk9ERVYpCj4gKyAgICAgICBpZiAocmV0ICYmIHJldCAhPSAtRU5P
REVWKSB7Cj4gKyAgICAgICAgICAgICAgIGtmcmVlKGlteHBkLT5lZGlkKTsKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPgo+ICAgICAgICAgaW14cGQtPmRldiA9IGRl
djsKPgo+ICAgICAgICAgcmV0ID0gaW14X3BkX3JlZ2lzdGVyKGRybSwgaW14cGQpOwo+IC0gICAg
ICAgaWYgKHJldCkKPiArICAgICAgIGlmIChyZXQpIHsKPiArICAgICAgICAgICAgICAga2ZyZWUo
aW14cGQtPmVkaWQpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgfQo+
Cj4gICAgICAgICBkZXZfc2V0X2RydmRhdGEoZGV2LCBpbXhwZCk7Cj4KPiAtLQo+IDIuMTcuMQo+
CgoKLS0gCk5hdmlkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
