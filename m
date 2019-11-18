Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1C101B10
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13126EB8A;
	Tue, 19 Nov 2019 08:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2561E6E851
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 23:05:39 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5F45580BF;
 Mon, 18 Nov 2019 23:06:15 +0000 (UTC)
Date: Mon, 18 Nov 2019 15:05:35 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191118230535.GG35479@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191117024028.2233-34-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4gWzE5
MTExNyAwNzoxMV06Cj4gV2UgY2FuIHNpbXBseSB1c2UgdGhlIGF0b21pYyBoZWxwZXIgZm9yCj4g
aGFuZGxpbmcgdGhlIGRpcnR5ZmIgY2FsbGJhY2suCi4uLgo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9jcnRjLmMKPiAtdm9pZCBvbWFwX2NydGNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjKQo+
ICtzdGF0aWMgdm9pZCBvbWFwX2NydGNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICB7
Cj4gIAlzdHJ1Y3Qgb21hcF9jcnRjICpvbWFwX2NydGMgPSB0b19vbWFwX2NydGMoY3J0Yyk7Cj4g
LQlzdHJ1Y3Qgb21hcF9jcnRjX3N0YXRlICpvbWFwX3N0YXRlID0gdG9fb21hcF9jcnRjX3N0YXRl
KGNydGMtPnN0YXRlKTsKPiAtCj4gLQlpZiAoIW9tYXBfc3RhdGUtPm1hbnVhbGx5X3VwZGF0ZWQp
Cj4gLQkJcmV0dXJuOwo+ICAKPiAgCWlmICghZGVsYXllZF93b3JrX3BlbmRpbmcoJm9tYXBfY3J0
Yy0+dXBkYXRlX3dvcmspKQo+ICAJCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmb21hcF9jcnRjLT51
cGRhdGVfd29yaywgMCk7CgpJdCB3b3VsZCBiZSBuaWNlIGlmIG9tYXBfY3J0Y19mbHVzaCgpIHdv
dWxkIGJlY29tZSBqdXN0IHNvbWUgZ2VuZXJpYwp2b2lkIGZ1bmN0aW9uIHdpdGggbm8gbmVlZCB0
byBwYXNzIGl0IGEgY3J0Yy4gSSBndWVzcyBmb3IgdGhhdCBpdApzaG91bGQga25vdyB3aGF0IHBh
bmVscyBhcmUgaW4gbWFudWFsIGNvbW1hbmQgbW9kZSB0byByZWZyZXNoIHRoZW0uCgpUaGUgcmVh
c29uIEknbSBicmluZ2luZyB0aGlzIHVwIGlzIGJlY2F1c2UgaXQgbG9va3MgbGlrZSB3ZSBuZWVk
CnRvIGFsc28gZmx1c2ggRFNJIGNvbW1hbmQgbW9kZSBwYW5lbHMgZnJvbSBvbWFwX2dlbV9vcF9m
aW5pc2goKQpmb3IgZ2xlcyBhbmQgdGhlIGdlbSBjb2RlIHByb2JhYmx5IHNob3VsZCBub3QgbmVl
ZCB0byBrbm93IGFueXRoaW5nCmFib3V0IGNydGMsIHJpZ2h0PwoKT3IgbWF5YmUgdGhlcmUgaXMg
c29tZSBiZXR0ZXIgcGxhY2UgdG8gY2FsbCBpdD8KClJlZ2FyZHMsCgpUb255Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
