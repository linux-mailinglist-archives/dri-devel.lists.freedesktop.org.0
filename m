Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE19D4DDA
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 09:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E3E6E454;
	Sat, 12 Oct 2019 07:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6766E454
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 07:15:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 265D72002E;
 Sat, 12 Oct 2019 09:15:28 +0200 (CEST)
Date: Sat, 12 Oct 2019 09:15:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 04/21] drm/exynos: Fix potential unbalanced calls to
 pm_runtime_put
Message-ID: <20191012071526.GA19311@ravnborg.org>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <CGME20190826152700epcas1p34f6efa9f4c77885901f4cb9181bcaffe@epcas1p3.samsung.com>
 <20190826152649.13820-5-boris.brezillon@collabora.com>
 <19d2998a-1b54-f5c2-1c9c-3eeced8b6f6d@samsung.com>
 <20191011162041.24953d44@dhcp-172-31-174-146.wireless.concordia.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011162041.24953d44@dhcp-172-31-174-146.wireless.concordia.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=jcKsRGPNCx3cP_Ozz1oA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMvQW5kcnplai4KCj4gCj4gPiAKPiA+IAo+ID4gPiBOb3RlIHRoYXQgLUVOT1NZUyBp
cyBhY3R1YWxseSBhIHZhbGlkIGNhc2UsIGl0IGp1c3QKPiA+ID4gbWVhbnMgdGhlIHBhbmVsIGRy
aXZlciBkb2VzIG5vdCBpbXBsZW1lbnQgdGhlIGhvb2suICAKPiA+IAo+ID4gCj4gPiBJdCB3b3Vs
ZCBiZSBnb29kIHRoZW4gdG8gZml4IGl0IGluIHBhbmVsIGZyYW1ld29yaywgaWUgd2l0aG91dCBo
b29rCj4gPiBkcm1fcGFuZWxfKiBmdW5jdGlvbiBzaG91bGQgcmV0dXJuIDAsIEVOT1NZUyBtYWtl
cyBubyBzZW5zZSBoZXJlLgo+IAo+IEknbSBmaW5lIHdpdGggdGhhdC4gVGhpZXJyeSwgU2FtLCBh
bnkgb3Bpbmlvbj8KCkFncmVlZCwgSSBoYXZlIGZvbGxvd2luZyBwYXRjaCBpbiBteSBwYW5lbCBw
YXRjaCBxdWV1ZToKCmRybS9kcm1fcGFuZWw6IG5vIGVycm9yIHdoZW4gbm8gY2FsbGJhY2sKCiAg
ICBUaGUgY2FsbGJhY2tzIGluIGRybV9wYW5lbF9mdW5jcyBhcmUgb3B0aW9uYWwsIHNvIGRvIG5v
dAogICAgcmV0dXJuIGFuIGVycm9yIGp1c3QgYmVjYXVzZSBubyBjYWxsYmFjayBpcyBhc3NpZ25l
ZC4KCiAgICBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgpJ
ZiBJIGdldCB0aW1lIHRoaXMgd2Vla2VuZCBJIHdpbGwgcmViYXNlL3Rlc3QgYW5kIHNlbmQgdGhl
CnNldCBvZiBwYXRjaGVzIG91dC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
