Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3C8114D72
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598C06F98F;
	Fri,  6 Dec 2019 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3BC6E988
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:06:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so4270942wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 08:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/s4H9123KM6cSQFYZYktesHNajGVy0K2OAZRf2rsEsA=;
 b=bIIFiI0GlG1spgT69vohUUW4cNXnPqx8k0vWRAYt+aPAitGxkCHYHKvn2R7VlEAR4T
 Yh3Upi66egZqfMUdm1fEtJhNCwxGJ5+dahGfR3v5TFiqKpPQ6qGVRw+ikw5m/inncX84
 ++xKF1ppV4zMZ9tUPyPwzyOU65PJWCUEfylpET0EKiCx/rch5Vfp+0PFzn2AfwgjSge7
 f7jzz2bVIVRHgcYySeToT7AdTfCU66QcqdLi5R/CztxPTYnxxm/y4op6w/Lsxnz7wgh0
 gdJp107RCdEq98WQ+7CbW/hWwiTmNEArc4ukXX9c6W04X2V84XMyKmabP5YhRa80aUaH
 vs6g==
X-Gm-Message-State: APjAAAUzWruS1huy7oD3Y576JC5DXFxeaz6Z/+gzY7Mz+H22+VyvQWDT
 Ir/ngF/5p2ecn5oW8sml6jloYmIYEjFaEA2mP7o=
X-Google-Smtp-Source: APXvYqwUaK6wevcF0G2jdgwbeylML3gO2zdknStkUF6zUyLRs8IjpTsXaAyF4wK7eINtAv+qQSOlb4+QXItUzBdKIbw=
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr5872302wmm.132.1575561972305; 
 Thu, 05 Dec 2019 08:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
 <20190619052716.16831-4-andrew.smirnov@gmail.com>
 <0d84fa72-bc96-9b88-cd89-c04327109e0e@ti.com>
In-Reply-To: <0d84fa72-bc96-9b88-cd89-c04327109e0e@ti.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 5 Dec 2019 08:06:00 -0800
Message-ID: <CAHQ1cqFK8nd4hs031_2=dk2WBVmP=es1CEadApwJ9MkzCGiQjw@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/s4H9123KM6cSQFYZYktesHNajGVy0K2OAZRf2rsEsA=;
 b=vc5HOWdrtJsCRrlTj+6bmgg9NGsYEUOJXVu2XK2vRzyVNMcyny5cQqCH/W7oG2r7OG
 B9VB0Jmj+VzXhvz9VhxLlRoOruinbQdlKhKUotk9hisTrs35KHHNkXRzn1ZrzoxTHsvr
 QLCep6vrizqHh7BM7rR3/+qL1UJFhTUwv2Q8Xmz9d4KmRgrQ2z5cXoy9cMyR8UwzGL9Y
 h+umO2o/9GoRtkZ/IeCTLBL+BaTaSZEnpi0OiVLyvH0j+ULA1YeR6OlfiNg5BUA07HUj
 eLqqIIj1xTYo8GKEYGnkSBBRF5Ht1Be3UG/1rmA8XwvA0zQVBc/KQLy8mxeQ+ka2IM/R
 9fJQ==
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgNCwgMjAxOSBhdCAxMDoyNyBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IEhpIEFuZHJleSwKPgo+IE9uIDE5LzA2LzIwMTkgMDg6
MjcsIEFuZHJleSBTbWlybm92IHdyb3RlOgo+Cj4gPiBAQCAtNzQ4LDIyICs3NDgsMTkgQEAgc3Rh
dGljIGludCB0Y19zZXRfdmlkZW9fbW9kZShzdHJ1Y3QgdGNfZGF0YSAqdGMsCj4gPgo+ID4gICBz
dGF0aWMgaW50IHRjX3dhaXRfbGlua190cmFpbmluZyhzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gPiAg
IHsKPiA+IC0gICAgIHUzMiB0aW1lb3V0ID0gMTAwMDsKPiA+ICAgICAgIHUzMiB2YWx1ZTsKPiA+
ICAgICAgIGludCByZXQ7Cj4gPgo+ID4gLSAgICAgZG8gewo+ID4gLSAgICAgICAgICAgICB1ZGVs
YXkoMSk7Cj4gPiAtICAgICAgICAgICAgIHRjX3JlYWQoRFAwX0xUU1RBVCwgJnZhbHVlKTsKPiA+
IC0gICAgIH0gd2hpbGUgKCghKHZhbHVlICYgTFRfTE9PUERPTkUpKSAmJiAoLS10aW1lb3V0KSk7
Cj4gPiAtCj4gPiAtICAgICBpZiAodGltZW91dCA9PSAwKSB7Cj4gPiArICAgICByZXQgPSB0Y19w
b2xsX3RpbWVvdXQodGMsIERQMF9MVFNUQVQsIExUX0xPT1BET05FLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIExUX0xPT1BET05FLCAxLCAxMDAwKTsKPgo+IFRoaXMgc2VlbXMgdG8g
YnJlYWsgRFAgYXQgbGVhc3Qgd2l0aCBzb21lIG1vbml0b3JzIGZvciBtZS4gSSB0aGluayBpdCdz
IGp1c3QgYSB0aW1lb3V0IHByb2JsZW0sIGFzCj4gaW5jcmVhc2luZyB0aGUgdmFsdWVzIGhlbHBz
Lgo+Cj4gVXNpbmcga3RpbWUsIEkgY2FuIHNlZSB0aGF0IGR1cmluZyBsaW5rIHRyYWluaW5nLCB0
aGUgZmlyc3QgY2FsbCB0YWtlcyB+Mm1zLCB0aGUgc2Vjb25kIH43bXMuIEkKPiB0aGluayB0aGlz
IHdvcmtlZCBiZWZvcmUsIGFzIHVkZWxheSgxKSB0YWtlcyBtdWNoIGxvbmdlciB0aGFuIDEgdXMu
Cj4KPiBXZSBoYXZlIDEwMDB1cyBsaW1pdCBpbiBhIGZldyBvdGhlciBwbGFjZXMgdG9vLCB3aGlj
aCBJIGRvbid0IHNlZSBjYXVzaW5nIGlzc3VlcywgYnV0IG1pZ2h0IG5lZWQKPiBpbmNyZWFzaW5n
IHRvby4KPgo+IEFsc28sIDF1cyBzbGVlcF91cyBtYXkgYmUgYSBiaXQgdG9vIHNtYWxsIHRvIGJl
IHNhbmUuIElmIHRoZSBsb29wcyB0YWtlIG1pbGxpc2Vjb25kcywgcHJvYmFibHkgMTAwdXMKPiBv
ciBldmVuIG1vcmUgd291bGQgbWFrZSBzZW5zZS4KPgo+IFRoaXMgZGlkbid0IGNhdXNlIGFueSBp
c3N1ZXMgd2l0aCB5b3VyIGRpc3BsYXk/Cj4KCkhtbSwgbm90IHRoYXQgSSBrbm93IG9mLiBZb3Vy
IHJlYXNvbmluZyBtYWtlcyBzZW5zZSwgdGhvdWdoLiBJZgppbmNyZWFzaW5nIHRoZSB0aW1lb3V0
IGhlbHBzLCBJIGFtIGFsbCBmb3IgaXQuIEFuZCwgeWVhaCwgSSBhZ3JlZSwKdGhpcyBpcyBwcm9i
YWJseSBub3QgdGhlIG9ubHkgcGxhY2UgdGhhdCBjb3VsZCB1c2UgYW4gaW5jcmVhc2VkCnRpbWVv
dXQuCgpUaGFua3MsCkFuZHJleSBTbWlybm92Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
