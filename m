Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F039532D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1546E59E;
	Tue, 20 Aug 2019 01:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676F06E529
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:18:00 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C0511176;
 Tue, 20 Aug 2019 03:17:53 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 31/50] drm/omap: hdmi4: Implement drm_bridge .hpd_notify()
 operation
Date: Tue, 20 Aug 2019 04:17:02 +0300
Message-Id: <20190820011721.30136-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263873;
 bh=RGyXq1o5HvyiuJpBfQ/mmX63633h0w10iBokeQsDSD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qgnH7LuTLwS/f36ostGS85TDWihpHzIdIL+9rRgrHXSQYmRqXqJ9eaCTQCsSWz2/1
 rST8mE975/s/4nP4i1DlErVkW6vumqEV3Nh8naqJRpqT2EdqFMO3Chg+4esdxUX6WV
 JPBHy8Am3MgnqIW5iDvhO8An9vzlQfk2eLIZKcuY=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEhETUk0IGVuY29kZXIgaXMgdHJhbnNpdGlvbmluZyB0byB0aGUgZHJtX2JyaWRnZSBBUEks
IGltcGxlbWVudCB0aGUKbGFzdCBtaXNzaW5nIG9wZXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQuYyB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZHNzL2hkbWk0LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQu
YwppbmRleCAyMjExYTdhM2RhZDMuLjM0OWIxMDgxYjk4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2hkbWk0LmMKQEAgLTU1MSw2ICs1NTEsMTUgQEAgc3RhdGljIHZvaWQgaGRtaTRfYnJpZGdl
X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAltdXRleF91bmxvY2soJmhkbWkt
PmxvY2spOwogfQogCitzdGF0aWMgdm9pZCBoZG1pNF9icmlkZ2VfaHBkX25vdGlmeShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlLAorCQkJCSAgICBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIHN0
YXR1cykKK3sKKwlzdHJ1Y3Qgb21hcF9oZG1pICpoZG1pID0gZHJtX2JyaWRnZV90b19oZG1pKGJy
aWRnZSk7CisKKwlpZiAoc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkKQor
CQloZG1pNF9jZWNfc2V0X3BoeXNfYWRkcigmaGRtaS0+Y29yZSwgQ0VDX1BIWVNfQUREUl9JTlZB
TElEKTsKK30KKwogc3RhdGljIHN0cnVjdCBlZGlkICpoZG1pNF9icmlkZ2VfcmVhZF9lZGlkKHN0
cnVjdCBvbWFwX2hkbWkgKmhkbWksCiAJCQkJCSAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiB7CkBAIC01NzAsNiArNTc5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJp
ZGdlX2Z1bmNzIGhkbWk0X2JyaWRnZV9mdW5jcyA9IHsKIAkubW9kZV9zZXQgPSBoZG1pNF9icmlk
Z2VfbW9kZV9zZXQsCiAJLmF0b21pY19lbmFibGUgPSBoZG1pNF9icmlkZ2VfZW5hYmxlLAogCS5h
dG9taWNfZGlzYWJsZSA9IGhkbWk0X2JyaWRnZV9kaXNhYmxlLAorCS5ocGRfbm90aWZ5ID0gaGRt
aTRfYnJpZGdlX2hwZF9ub3RpZnksCiAJLmdldF9lZGlkID0gaGRtaTRfYnJpZGdlX2dldF9lZGlk
LAogfTsKIAotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
