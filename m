Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82600BB8DC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 18:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89C26E968;
	Mon, 23 Sep 2019 16:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A776E968
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 16:00:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 270F653B;
 Mon, 23 Sep 2019 18:00:55 +0200 (CEST)
Date: Mon, 23 Sep 2019 19:00:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 06/11] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20190923160045.GE5056@pendragon.ideasonboard.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-7-dmitry.torokhov@gmail.com>
 <20190920231228.GH12672@pendragon.ideasonboard.com>
 <20190923150333.GD16243@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923150333.GD16243@kuha.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569254455;
 bh=Etat8NN7YLvsW2f3sC337/iHi/6qZmsmzIordeWfKk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HkZLp6T2S5QxbJRI7OaV54luhyvzV8n+O1mR5gtRTjuF6hnhK/kji0uJzF7LsONPJ
 iuYn0eUA3oYTT/3KqkHeTICg0gzqMTAho7VwH2/bxjlXlMB2MGtA5Z2ziIQCplolcU
 peP0LQ0N1BnqbCyXMyxbqkGL0PZNe+/YlxqQjCTE=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-gpio@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa2tpLAoKT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDY6MDM6MzNQTSArMDMwMCwgSGVp
a2tpIEtyb2dlcnVzIHdyb3RlOgo+IE9uIFNhdCwgU2VwIDIxLCAyMDE5IGF0IDAyOjEyOjI4QU0g
KzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBIaSBEbWl0cnksCj4gPiAKPiA+IChD
QydpbmcgSGVpa2tpIGFzIHRoZSBvcmlnaW5hbCBhdXRob3Igb2Ygc29mdHdhcmUgbm9kZXMgc3Vw
cG9ydCkKPiA+IAo+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gPiAKPiA+IE9uIFdlZCwg
U2VwIDExLCAyMDE5IGF0IDEyOjUyOjEwQU0gLTA3MDAsIERtaXRyeSBUb3Jva2hvdiB3cm90ZToK
PiA+ID4gSW5zdGVhZCBvZiBmd25vZGVfZ2V0X25hbWVkX2dwaW9kKCkgdGhhdCBJIHBsYW4gdG8g
aGlkZSBhd2F5LCBsZXQncyB1c2UKPiA+ID4gdGhlIG5ldyBmd25vZGVfZ3Bpb2RfZ2V0X2luZGV4
KCkgdGhhdCBtaW1pY3MgZ3Bpb2RfZ2V0X2luZGV4KCksIGJpdAo+ID4gCj4gPiBzL2JpdC9idXQv
Cj4gPiAKPiA+ID4gd29ya3Mgd2l0aCBhcmJpdHJhcnkgZmlybXdhcmUgbm9kZS4KPiA+ID4gCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWls
LmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IAo+ID4gT24gYSBzaWRlIG5vdGUsIGFzIEknbSBu
b3QgdmVyeSBmYW1pbGlhciB3aXRoIHNvZnR3YXJlIG5vZGVzLCBJIHRyaWVkIHRvCj4gPiBzZWUg
aG93IHRoZXkgYXJlIHRvIGJlIHVzZWQsIGFuZCBpdCBzZWVtcyB0aGV5IGFyZSBjb21wbGV0ZWx5
Cj4gPiB1bmRvY3VtZW50ZWQgOi0oIEhlaWtraSwgaXMgdGhpcyBzb21ldGhpbmcgdGhhdCBjb3Vs
ZCBiZSBmaXhlZCA/Cj4gCj4gT0suIEknbGwgc3RhcnQgd3JpdGluZyBBUEkgZG9jdW1lbnRhdGlv
biBmb3IgaXQuCgpUaGF0J3MgZ3JlYXQsIHRoYW5rcyAhIEknbGwgZG8gbXkgYmVzdCB0byByZXZp
ZXcgaXQgaWYgeW91IENDIG1lLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
