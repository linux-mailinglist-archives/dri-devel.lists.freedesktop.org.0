Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24197E1FD1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319386EB22;
	Wed, 23 Oct 2019 15:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2D78959D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:45:34 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A6C5928F907;
 Wed, 23 Oct 2019 16:45:32 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 18/21] drm/bridge: panel: Propage bus format/flags
Date: Wed, 23 Oct 2019 17:45:09 +0200
Message-Id: <20191023154512.9762-19-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gdGhhdCB0aGUgcHJldmlvdXMgYnJpZGdlIGVsZW1lbnQgaW4gdGhlIGNoYWluIGtub3dzIHdo
aWNoIGlucHV0CmZvcm1hdCB0aGUgcGFuZWwgYnJpZGdlIGV4cGVjdHMuCgpTaWduZWQtb2ZmLWJ5
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgotLS0KQ2hh
bmdlcyBpbiB2MzoKKiBBZGp1c3QgdGhpbmdzIHRvIG1hdGNoIHRoZSBuZXcgYnVzLWZvcm1hdCBu
ZWdvdGlhdGlvbiBhcHByb2FjaAoqIFVzZSBkcm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfcHJvcGFn
YXRlX2J1c19mbXQKKiBEb24ndCBpbXBsZW1lbnQgLT5hdG9taWNfY2hlY2soKSAodGhlIGNvcmUg
bm93IHRha2VzIGNhcmUgb2YgYnVzCiAgZmxhZ3MgcHJvcGFnYXRpb24pCgpDaGFuZ2VzIGluIHYy
OgoqIEFkanVzdCB0aGluZ3MgdG8gbWF0Y2ggdGhlIG5ldyBidXMtZm9ybWF0IG5lZ290aWF0aW9u
IGFwcHJvYWNoCi0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKaW5kZXggZjRl
MjkzZTdjZjY0Li5hNzBjMzYzYTJiZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvcGFuZWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKQEAgLTEyNyw2
ICsxMjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgcGFuZWxfYnJp
ZGdlX2JyaWRnZV9mdW5jcyA9IHsKIAkuZW5hYmxlID0gcGFuZWxfYnJpZGdlX2VuYWJsZSwKIAku
ZGlzYWJsZSA9IHBhbmVsX2JyaWRnZV9kaXNhYmxlLAogCS5wb3N0X2Rpc2FibGUgPSBwYW5lbF9i
cmlkZ2VfcG9zdF9kaXNhYmxlLAorCS5hdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzID0gZHJtX2F0
b21pY19oZWxwZXJfYnJpZGdlX3Byb3BhZ2F0ZV9idXNfZm10LAogfTsKIAogLyoqCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
