Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2182766947
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACA56E2EE;
	Fri, 12 Jul 2019 08:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8056E2EE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:42:35 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hlr8Q-0006Pi-IM; Fri, 12 Jul 2019 10:42:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH] drm/stm: attach gem fence to atomic state
Date: Fri, 12 Jul 2019 10:42:28 +0200
Message-Id: <20190712084228.8338-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4KClRvIHByb3Blcmx5
IHN5bmNocm9uaXplIHdpdGggb3RoZXIgZGV2aWNlcyB0aGUgZmVuY2UgZnJvbSB0aGUgR0VNCm9i
amVjdCBiYWNraW5nIHRoZSBmcmFtZWJ1ZmZlciBuZWVkcyB0byBiZSBhdHRhY2hlZCB0byB0aGUg
YXRvbWljCnN0YXRlLCBzbyB0aGUgY29tbWl0IHdvcmsgY2FuIHdhaXQgb24gZmVuY2Ugc2lnbmFs
aW5nLgoKU2lnbmVkLW9mZi1ieTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5k
ZT4KU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRleCAyZmU2YzRhOGQ5MTUuLjNhYjRmYmY4ZWIw
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMKQEAgLTI2LDYgKzI2LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2Zi
X2NtYV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZl
cl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX29mLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9w
bGFuZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgpAQCAtOTIy
LDYgKzkyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGx0ZGNfcGxh
bmVfZnVuY3MgPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJf
ZnVuY3MgbHRkY19wbGFuZV9oZWxwZXJfZnVuY3MgPSB7CisJLnByZXBhcmVfZmIgPSBkcm1fZ2Vt
X2ZiX3ByZXBhcmVfZmIsCiAJLmF0b21pY19jaGVjayA9IGx0ZGNfcGxhbmVfYXRvbWljX2NoZWNr
LAogCS5hdG9taWNfdXBkYXRlID0gbHRkY19wbGFuZV9hdG9taWNfdXBkYXRlLAogCS5hdG9taWNf
ZGlzYWJsZSA9IGx0ZGNfcGxhbmVfYXRvbWljX2Rpc2FibGUsCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
