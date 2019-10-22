Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111DE0A8B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 19:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42D6E8A9;
	Tue, 22 Oct 2019 17:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D336E8A9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 17:23:28 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 173BA285294;
 Tue, 22 Oct 2019 18:23:27 +0100 (BST)
Date: Tue, 22 Oct 2019 19:23:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 04/21] drm/exynos: Fix potential unbalanced calls to
 pm_runtime_put
Message-ID: <20191022192323.37b54d99@collabora.com>
In-Reply-To: <19d2998a-1b54-f5c2-1c9c-3eeced8b6f6d@samsung.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <CGME20190826152700epcas1p34f6efa9f4c77885901f4cb9181bcaffe@epcas1p3.samsung.com>
 <20190826152649.13820-5-boris.brezillon@collabora.com>
 <19d2998a-1b54-f5c2-1c9c-3eeced8b6f6d@samsung.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMSBPY3QgMjAxOSAxNTo1NDo1MyArMDIwMApBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPiB3cm90ZToKCj4gT24gMjYuMDguMjAxOSAxNzoyNiwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gVGhlIGVuY29kZXItPmVuYWJsZSgpIGNhbid0IHJlcG9ydCBlcnJvcnMg
YW5kIGlzIGV4cGVjdGVkIHRvIGFsd2F5cwo+ID4gc3VjY2VlZC4gSWYgd2UgY2FsbCBwbV9ydW50
aW1lX3B1dCgpIGluIHRoZSBleHlub3NfZHNpX2VuYWJsZSgpIGVycm9yCj4gPiBwYXRoIChhcyBj
dXJyZW50bHkgZG9uZSkgd2UnbGwgaGF2ZSB1bmJhbGFuY2VkIGdldC9wdXQgY2FsbHMgd2hlbgo+
ID4gZW5jb2Rlci0+ZGlzYWJsZSgpIGlzIGNhbGxlZC4gIAo+IAo+IAo+IFRydWUKCkkganVzdCBy
ZWFsaXplZCB0aGlzIGlzIGFjdHVhbGx5IG5vdCB0aGUgY2FzZSwgYmVjYXVzZSB0aGUKRFNJTV9T
VEFURV9FTkFCTEVEIGZsYWcgaXMgY2xlYXJlZCBpbiB0aGUgZXJyb3IgcGF0aCwgYW5kCmV4eW5v
c19kc2lfZGlzYWJsZSgpIGJhaWxzIG91dCBlYXJseSB3aGVuIERTSU1fU1RBVEVfRU5BQkxFRCBp
cyBub3Qgc2V0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
